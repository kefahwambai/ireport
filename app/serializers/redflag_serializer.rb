class RedflagSerializer < ActiveModel::Serializer
  
  attributes :id, :title, :description, :status, :location
  has_one :user

 
end
