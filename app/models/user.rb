class User < ApplicationRecord
  #Validations
   validates_presence_of :name, :email, :password_digest
   validates :email, uniqueness: true
   has_many :companies
   has_many :managers, through: :companies
   has_many :employees, through: :managers

   #encrypt password
   has_secure_password
  
end
