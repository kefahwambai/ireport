class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler
  include CanCan::ControllerAdditions
  rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed

  def authenticate_request!
    return invalid_authentication unless valid_token?

    current_user!
    invalid_authentication unless @current_user
  end

  # def current_user!
  #   Rails.logger.info("Payload: #{payload}")
  #   user_id = payload[0]['user']['id']
  #   Rails.logger.info("User ID from Token: #{user_id}")
  #   @current_user = User.find_by(id: user_id)
  
  #   unless @current_user
  #     Rails.logger.warn("User with ID #{user_id} not found.")
  #   end
  # end
  def current_user!
    @current_user ||= begin
      token = request.headers['Authorization']&.split(' ')&.last
      decoded_token = AuthenticationTokenService.decode(token)
      User.find(decoded_token[0]['user']['id']) if decoded_token
    rescue ActiveRecord::RecordNotFound => e
      # Handle the case where the user record is not found
      nil
    end
  end
  

  private

  def valid_token?
    payload.present? && AuthenticationTokenService.valid_payload(payload.first)
  end

  def payload
    auth_header = request.headers['Authorization']
    return nil unless auth_header.present?
  
    token = auth_header.split(' ').last
    decoded_token = AuthenticationTokenService.decode(token)
    Rails.logger.info("Decoded Token: #{decoded_token}")
    decoded_token
  rescue StandardError
    nil
  end
  

  def invalid_authentication
    render json: { error: 'You need to log in first' }, status: :unauthorized
  end
end
