class GymSerializer < ActiveModel::Serializer
  attributes :name, :address
  has_many :memberships
  has_many :clients, through: :memberships
end
