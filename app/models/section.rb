class Section < ApplicationRecord
	belongs_to :project
	has_many :tasks, dependent: :destroy

	has_many :drops
	belongs_to :user

	has_many :tags_tagables, as: :tagable, dependent: :destroy
	has_many :tags, through: :tags_tagables



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

	def self.tagged_with(title)
		Tag.find_by!(name: title).posts
	end

	def self.tag_counts
		Tag.select('tags.*, count(tags_tagbales.tag_id) as count').joins(:tags_tagbales).group('tags_tagables.tag_id')
	end

	def tag_list
		tags.map(&:title).join(', ')
	end

	def tag_list=(titles)
		self.tags = titles.split(',').map do |t|
		  Tag.where(title: t.strip).first_or_create!
		end
	end
end
