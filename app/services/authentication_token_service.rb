class AuthenticationTokenService
    HMAC_SECRET = Rails.application.secrets.secret_key_base
    ALGORITHM_TYPE = 'HS256'.freeze
  
    def self.encode(user_id)
      exp = 1.hours.from_now.to_i
      user = User.find(user_id)
      payload = { user: UserSerializer.new(user).as_json, exp: exp }
      JWT.encode payload, HMAC_SECRET, ALGORITHM_TYPE
      JWT.encode payload, HMAC_SECRET, ALGORITHM_TYPE
    end
  
    def self.decode(token)
      JWT.decode token, HMAC_SECRET, true, { algorithm: ALGORITHM_TYPE }
    rescue JWT::ExpiredSignature, JWT::DecodeError
      nil
    end
  
    def self.valid_payload(payload)
      !expired(payload)
    end
  
    def self.expired(payload)
      Time.at(payload['exp']) < Time.now
    end
end
  