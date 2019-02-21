class Company < ApplicationRecord
  belongs_to :user
  has_many :managers
  has_many :employees, through: :managers
end
