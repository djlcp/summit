class Task < ApplicationRecord
	belongs_to :section
	has_many :steps, dependent: :destroy

	def deadline
		section.start_date + days_given
	end

	def complete?(user)
		steps.all? {|s| s.complete?(user)}
	end

	def overdue?(user)
		Date.today > deadline && complete?(user) == false
	end
end
