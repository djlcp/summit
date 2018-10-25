class Project < ApplicationRecord
	has_many :projects, dependent: :destroy 
end
