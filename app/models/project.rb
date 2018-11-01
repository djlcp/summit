class Project < ApplicationRecord
	has_many :sections, dependent: :destroy 
end
