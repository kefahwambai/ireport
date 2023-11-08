class User < ApplicationRecord
 include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: self

  
  has_many :redflags
  has_many :interventions
  validates :admin, inclusion: { in: [true, false] }
  validates :name, presence: true, uniqueness: true


  def generate_jwt
       payload = { user_id: id }
       JWT.encode(payload, Rails.application.credentials.fetch(:secret_key_base), 'HS256')
  end  


     
end
