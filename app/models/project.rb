class Project < ApplicationRecord
	has_many :sections, dependent: :destroy 

	def completion_date
		if sections.count > 0
			final_section = sections.max_by { |section| section.deadline }
			final_section.deadline
		else
			start_date
		end
	end

	def project_length
		(completion_date - start_date).to_f.to_i
	end
end
