class Task < ApplicationRecord
	belongs_to :section
	has_many :steps, dependent: :destroy
	has_many :tags_tagables, as: :tagable, dependent: :destroy
	has_many :tags, through: :tags_tagables

	def deadline
		section.start_date + days_given
	end

	def complete?(user)
		steps.all? { |s| s.complete?(user) }
	end

	def overdue?(user)
		Date.today > deadline && complete?(user) == false
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
