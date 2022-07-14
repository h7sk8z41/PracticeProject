class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :content, presence: true, length: { minimum: 1}
  def author?(user)
    user == self.user
  end
end
