class PasswordResetsController < ApplicationController
    def create
      user = User.find_by(email: params[:email])
      if user
        user.send_reset_password_instructions
      end
     
      render json: { message: 'Password reset instructions sent' }, status: :ok
    end
  
    def update
      user = User.reset_password_by_token(reset_password_params)
      if user.errors.empty?
        
        render json: { message: 'Password successfully reset' }, status: :ok
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def reset_password_params
      params.permit(:reset_password_token, :password, :password_confirmation)
    end
  end
  