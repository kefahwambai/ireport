class User < ApplicationRecord

  
  has_many :redflags
  has_secure_password
  has_many :interventions
  validates :admin, inclusion: { in: [true, false] }
  validates :name, presence: true, uniqueness: true




     
end
