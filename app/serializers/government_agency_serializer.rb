class GovernmentAgencySerializer 
  include JSONAPI::Serializer
  attributes :id, :name
  has_many :interventions
end
