class Comment < ApplicationRecord
	belongs_to :post, polymorphic: true
end
