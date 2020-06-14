class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true
  validates :profile, length: { maximum: 200 }
  
  has_many :posts
  has_many :comments
  has_many :favorites
  has_many :favorite_posts, through: :favorites, source: :post

  mount_uploader :image, ImageUploader
end
