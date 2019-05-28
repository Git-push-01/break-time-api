class BreakSerializer < ActiveModel::Serializer
  attributes :id, :breakdate, :breaketime, :breakend
  
  has_one :employee
end
