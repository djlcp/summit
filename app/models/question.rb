class Question < ApplicationRecord
	has_many :answers, dependent: :destroy
	has_many :comments, as: :post, dependent: :destroy
	belongs_to :user
end
