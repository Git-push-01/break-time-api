class Employee < ApplicationRecord
  belongs_to :user
  belongs_to :company
  belongs_to :manager
  has_many :breaks
end
