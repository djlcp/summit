class Lesson < ApplicationRecord
	belongs_to :project

	def date
		lessons_array = project.assign_lesson_dates
		lesson_date = lessons_array.rassoc(self)
		lesson_date[0]
	end
end
