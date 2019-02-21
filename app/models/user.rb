class User < ApplicationRecord
  #has_secure_password
  has_many :companies
  has_many :managers, through: :companies
  has_many :employees, through: :managers

end
