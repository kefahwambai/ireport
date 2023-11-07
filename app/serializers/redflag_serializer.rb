class RedflagSerializer 
  include JSONAPI::Serializer
  attributes :id, :title, :description, :status, :location
  has_one :user

 
end
