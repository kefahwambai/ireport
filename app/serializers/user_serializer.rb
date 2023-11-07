class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :admin

  has_many :redflags
  has_many :interventions


end
