class Project < ApplicationRecord
	has_many :sections, dependent: :destroy 
	has_many :lessons, dependent: :destroy
	has_many :users_projects, dependent: :destroy
	has_many :users, :through => :users_projects
	has_many_attached :drops
	has_many :files
	has_many :drops

	def completion_date
		if sections.count > 0
			final_section = sections.max_by { |section| section.deadline }
			final_section.deadline
		else
			start_date
		end
	end

	def project_length
		(completion_date - start_date).to_f.to_i
	end

	def lesson_days_array
		lesson_days = []
		mask = 64
		(0..6).each do |day|
			lesson_days.push(day) if course_days & mask > 0
			mask /= 2
		end
		lesson_days
	end

	def ordered_lessons_array
		lessons.sort_by {|lesson| lesson.lesson_no}
	end

	def lesson_dates
		lesson_days_array
		lesson_dates_array = []
		permitted_lesson_dates = []
		permitted_lesson_dates = (start_date..completion_date).to_a.keep_if {|day| lesson_days_array.include?(day.wday)}
	end

	def assign_lesson_dates
		lessons_array = lesson_dates.zip(ordered_lessons_array)
		lessons_array.delete_if {|lesson| lesson.include?(nil)}
	end

    def user_timeline_position(user)
		(user_progress(user).to_f/project_length)*100
    end

    def user_progress(user)
		current_section = sections.detect { |section| section.complete?(user) == false } 
		section_progress = 0
  		if current_section != nil
  			progress = current_section.commencement_day
  			current_section.tasks.each do |task|
  				section_progress = task.days_given if task.complete?(user)
  			end
  		else
  			progress = project_length
  		end
  		progress += section_progress
    end

    def lesson_section(lesson)
    	sections.detect { |s| lesson.date >= s.start_date && lesson.date <= s.deadline}
    end



end
