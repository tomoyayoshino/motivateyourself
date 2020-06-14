class Post < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  has_many :comments
  has_many :favorites

  mount_uploader :image, ImageUploader

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end
end
