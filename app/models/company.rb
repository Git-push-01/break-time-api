class Company < ApplicationRecord
  has_many :managers
  has_many :employees, through: :managers
end
