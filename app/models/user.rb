class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts, dependent: :destroy , :through => :comments
  has_many :comments
  has_many :like
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
