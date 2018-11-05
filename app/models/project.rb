class Project < ApplicationRecord
	has_many :sections, dependent: :destroy 

	def completion_date
		final_section = sections.max_by { |section| section.deadline }
		final_section.deadline
	end
end
