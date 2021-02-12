class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name
    validates :birthday
  end

  VALID_ZENKAKU_REGEX = /\A[ぁ-んァ-ヶ一-龥々]+\z/
  with_options presence: true, format:{with: VALID_ZENKAKU_REGEX, message: '全角文字を使用してください' } do
    validates :first_name_kan
    validates :last_name_kan
  end

  VALID_KATAKANA_REGEX = /\A[ァ-ヶー－]+\z/
  with_options presence: true, format:{with: VALID_KATAKANA_REGEX, message: '全角カタカナを使用してください' }do
  validates :first_name_kata
  validates :last_name_kata
  end

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  with_options format:{with: VALID_PASSWORD_REGEX, message: '英字と数字の両方を含めて設定してください'}do
    validates :password
  end

  has_many :items
  has_many :orders
end
