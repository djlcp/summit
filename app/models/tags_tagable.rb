class TagsTagable < ApplicationRecord
	belongs_to :tag
	belongs_to :tagable, polymorphic: true
end
