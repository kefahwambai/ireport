class InterventionSerializer < ActiveModel::Serializer
  
  attributes :id, :title, :description, :status, :location, :image
  has_one :user
  has_one :government_agency
end
