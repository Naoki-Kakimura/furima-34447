class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, precense: true
  validates :first_name_kan, precense: true
  validates :last_name_kan, precense: true
  validates :first_name_kata, precense: true
  validates :last_name_kata, precense: true
  validates :birthday, precense: true
end
