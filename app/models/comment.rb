class Comment < ApplicationRecord
	belongs_to :post, polymorphic: true
	belongs_to :user
	has_many :notifications, as: :notifiable, dependent: :destroy

end
