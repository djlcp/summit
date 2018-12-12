class Answer < ApplicationRecord
	belongs_to :question
	has_many :comments, as: :post, dependent: :destroy
	belongs_to :user
	has_many :votes, as: :post, dependent: :destroy
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
		users - current_user
		users.uniq
	end
end
