class Post < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  has_many :comments
  has_many :favorites
  acts_as_taggable

  mount_uploader :image, ImageUploader

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end
  
  def self.search(search)
    return Post.includes(:user) unless search
    Post.where('content LIKE(?)', "%#{search}%")
  end
end
