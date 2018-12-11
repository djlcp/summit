class Tag < ApplicationRecord
 	has_many :tags_tagables, as: :tagable, dependent: :destroy
	has_many :questions, through: :tags_tagables, source: :tagable, source_type: "Question"
end
