class Question < ApplicationRecord
	has_many :answers, dependent: :destroy
	has_many :comments, as: :post, dependent: :destroy
	has_many :votes, as: :post, dependent: :destroy
	belongs_to :user
	has_many :notifications, as: :notifiable, dependent: :destroy

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
end
