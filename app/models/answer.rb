class Answer < ApplicationRecord
	belongs_to :question
	has_many :comments, as: :post
end
