class ManagerSerializer < ActiveModel::Serializer
  attributes :id, :managername
  has_one :user
  has_one :company


end
