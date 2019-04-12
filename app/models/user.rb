class User < ApplicationRecord
  #Validations
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  has_many :companies
  has_many :managers, through: :companies
  has_many :employees, through: :managers


end
