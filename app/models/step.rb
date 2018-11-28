class Step < ApplicationRecord
	belongs_to :task
	has_many :completes, dependent: :destroy
	has_many :users, through: :completes
end
