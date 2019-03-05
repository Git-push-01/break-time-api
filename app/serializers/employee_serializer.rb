class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :employeename
  has_one :user
  has_one :company
  has_one :manager
end
