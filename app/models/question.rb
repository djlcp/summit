class Question < ApplicationRecord
	has_many :answers, dependent: :destroy
	has_many :comments, as: :post, dependent: :destroy
	has_many :votes, as: :post, dependent: :destroy
	belongs_to :user
	has_many :notifications, as: :notifiable, dependent: :destroy
	has_many :tags_tagables, as: :tagable, dependent: :destroy
	has_many :tags, through: :tags_tagables

	def score 
		votes.up.count - votes.down.count
	end

	def users
		users = []
		users << user
		comments.each do |comment|
			users << comment.user
		end
		answers.each do |answer|
			users + answer.users 
		end
		users.uniq
	end

	def self.tagged_with(title)
	    Tag.find_by!(title: title).questions
	end

	def self.tag_counts
		Tag.select('tags.*, count(tags_tagables.tag_id) as count').joins(:tags_tagables).group('tags_tagables.tag_id')
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
