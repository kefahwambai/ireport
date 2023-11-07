class User < ApplicationRecord
 include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :confirmable, :rememberable,
         :recoverable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: self

  
  has_many :redflags
  has_many :interventions
  validates :admin, inclusion: { in: [true, false] }
  validates :name, presence: true, uniqueness: true
 
  
  
     
end
