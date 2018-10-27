class Comment < ApplicationRecord
	belongs_to :questions
	has_many :votes
end
