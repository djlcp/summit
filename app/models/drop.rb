class Drop < ApplicationRecord
	belongs_to :user
	belongs_to :step, through: :task, through: :section, through: :project
	has_one_attached :file
end
