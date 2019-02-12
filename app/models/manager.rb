class Manager < ApplicationRecord
  belongs_to :company
  has_many :employees
  has_many :breaks, through: :employees
end
