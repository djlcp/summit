class Tag < ApplicationRecord
	has_many :tags_tagables, dependent: :destroy
	has_many :tagables, through: :tags_tagables
 	has_many :questions, through: :tags_tagables, source: :tagable, source_type: "Question"

end
