class Question < ApplicationRecord
	has_many :answers, dependent: :destroy
	has_many :comments, as: :post, dependent: :destroy
	has_many :votes, as: :post, dependent: :destroy
	belongs_to :user


	def score 
		votes.up.count - votes.down.count
	end
end
