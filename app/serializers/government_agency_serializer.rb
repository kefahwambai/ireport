class GovernmentAgencySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :interventions
end
