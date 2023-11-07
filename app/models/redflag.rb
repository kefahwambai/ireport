class Redflag < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one_attached :video
  validates :location, presence: true
  geocoded_by :location
  after_validation :geocode, if: :location_changed?
end
