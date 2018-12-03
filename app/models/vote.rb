class Vote < ApplicationRecord
  belongs_to :post, polymorphic: true
  belongs_to :user
  enum direction: { down: 0, up: 1 }

  validates :user_id, uniqueness: { scope: [:post_id, :post_type] }
end

