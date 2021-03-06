class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts, dependent: :destroy #, :through => :comments
  has_many :comments, dependent: :destroy
  has_many :like, dependent: :destroy

  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
           class_name:  "Relationship",
           dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]
  validate :validate_username
  attr_writer :login

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end
  def login
    @login || self.username || self.email
  end
end
