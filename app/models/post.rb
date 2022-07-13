class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user
  validates :title, presence: true, length: { minimum: 1}
  validates :body, presence: true, length: { minimum: 1}
end
