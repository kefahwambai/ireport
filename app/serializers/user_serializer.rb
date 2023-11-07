class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :email, :id_number, :admin

  has_many :redflags
  has_many :interventions
end
