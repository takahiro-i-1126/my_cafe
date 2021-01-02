class Review < ApplicationRecord
  belongs_to :user
  belongs_to :store
  has_one_attached :image
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :store_id, presence: true
  validates :content, length:{maximum: 1000}
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
                                        message: "must be a valid image format" },
                        size:         { less_than: 5.megabytes,
                                        message: "should be less than 5MB" }

  # 表示用のリサイズ済み画像を返す
def display_image
  image.variant(resize:'500x500').processed
end
end
