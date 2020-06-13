class Post < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  mount_uploader :image, ImageUploader

end
