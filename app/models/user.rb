class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :birthday, presence: true

  with_options presence: true, format:{with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
    validates :first_name_kan
    validates :last_name_kan
  end

  with_options presence: true, format:{with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用してください' }do
  validates :first_name_kata
  validates :last_name_kata
  end

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  with_options format:{with: VALID_PASSWORD_REGEX, message: '英字と数字の両方を含めて設定してください'}do
    validates :password
  end
end