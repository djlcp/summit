class Section < ApplicationRecord
	belongs_to :project
	has_many :tasks, dependent: :destroy


	def start_date
		project.start_date + commencement_day - 1
	end

	def deadline
		start_date + duration
	end
end
