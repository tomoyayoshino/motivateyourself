class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :place, presence: true
  validates :day, presence: true
  validates :start, presence: true
  validates :end, presence: true

  belongs_to :user
  has_many :participations
  has_many :participation_users, through: :participations, source: :user

  def participated_by?(user)
    participations.where(user_id: user.id).exists?
  end
end
