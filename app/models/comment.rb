class Comment < ApplicationRecord
	belongs_to :questions
	belongs_to :user
	has_many :votes
end
