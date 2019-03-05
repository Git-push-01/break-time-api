class CompanySerializer < ActiveModel::Serializer
  attributes :id, :companyname
  has_one :user
end
