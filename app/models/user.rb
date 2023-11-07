class User < ApplicationRecord
 include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: self

  
  has_many :redflags
  has_many :interventions
  validates :admin, inclusion: { in: [true, false] }
  validates :name, presence: true, uniqueness: true
  validates :email, uniqueness: true, length: { in: 3..255 }, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true
  validates :password, length: { in: 6..255 }, allow_nil: true   
  
  
  
     
end
