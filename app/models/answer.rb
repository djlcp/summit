class Answer < ApplicationRecord
	belongs_to :question
	has_many :comments, as: :post, dependent: :destroy
	belongs_to :user
	has_many :votes, as: :post, dependent: :destroy

	def score 
		votes.up.count - votes.down.count
	end
end
