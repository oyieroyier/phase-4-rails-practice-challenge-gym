class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :age
  has_many :memberships
  has_many :gyms, through: :memberships
end
