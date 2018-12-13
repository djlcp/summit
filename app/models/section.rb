class Section < ApplicationRecord
	belongs_to :project
	has_many :tasks, dependent: :destroy
	has_many :drops
	belongs_to :user


	def start_date
		project.start_date + commencement_day
	end

	def deadline
		start_date + duration
	end

	def section_completion_day
		commencement_day + duration
	end

	def timeline_position
		(section_completion_day.to_f/project.project_length)*100
	end

	def complete?(user)
		tasks.all? {|t| t.complete?(user)}
	end

	def overdue?(user)
		Date.today > deadline && complete?(user) == false
	end

	def current
		Date.today >= start_date && Date.today <= deadline
	end
end
