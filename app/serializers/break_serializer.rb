class BreakSerializer < ActiveModel::Serializer
  attributes :id, :breakdate, :breaketime, :breakend
  has_one :user
  has_one :employee
end
