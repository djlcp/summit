class Task < ApplicationRecord
	belongs_to :section
	has_many :steps, dependent: :destroy
end
