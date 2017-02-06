class Event < ApplicationRecord
  has_many :reviews
  has_many :trips

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :date, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
