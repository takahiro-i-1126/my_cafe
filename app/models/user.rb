class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  before_save { self.email = email.downcase }
  validates :name, presence: true, length:{maximum: 50}
  validates :email, presence: true, length:{maximum: 255},
                  uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length:{minimum: 6}

  # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # 試作feedの定義
  # 完全な実装は次章の「ユーザーをフォローする」を参照
  def feed
    Review.where("user_id = ?", id)
  end
end
