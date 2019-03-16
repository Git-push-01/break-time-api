class UserSerializer < ActiveModel::Serializer
  attributes :name, :email, :password
  has_many :companies
  has_many :managers
  has_many :employees

end
