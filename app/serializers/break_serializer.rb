class BreakSerializer < ActiveModel::Serializer
  attributes :id, :breakdate, :breaketime
  has_one :user
  has_one :employee
end
