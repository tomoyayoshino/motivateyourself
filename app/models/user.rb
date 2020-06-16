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

  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  mount_uploader :image, ImageUploader

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end
end
