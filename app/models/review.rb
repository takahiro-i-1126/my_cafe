class Review < ApplicationRecord
  belongs_to :user
  belongs_to :store
  has_one_attached :image
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :store_id, presence: true
  validates :content, length:{maximum: 1000}


end
