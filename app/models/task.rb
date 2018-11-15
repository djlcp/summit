class Task < ApplicationRecord
	belongs_to :section
	has_many :steps, dependent: :destroy

	def deadline
		section.start_date + days_given
	end
end
