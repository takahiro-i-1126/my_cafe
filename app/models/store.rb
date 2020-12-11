class Store < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence:true, length:{maximum: 50}
  validates :title, length:{maximum: 255}
  validates :introduction, length:{maximum: 1000}
end
