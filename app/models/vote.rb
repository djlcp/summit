class Vote < ApplicationRecord
	belongs_to :comment
	belongs_to :user
	validates :user_id, uniqueness: { scope: :comment_id }

	enum status: {up: 1, down: -1}
end
