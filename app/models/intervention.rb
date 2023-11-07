class Intervention < ApplicationRecord
  belongs_to :user
  belongs_to :government_agency  
  has_one_attached :image
  has_one_attached :video
  validates :location, presence: true
  geocoded_by :location
  after_validation :geocode, if: :location_changed?
 
end
