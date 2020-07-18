class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :place, presence: true
  validates :day, presence: true
  validates :start, presence: true
  validates :end, presence: true

  belongs_to :user
  has_many :participations
end
