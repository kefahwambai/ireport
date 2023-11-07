class Users::RegistrationsController < Devise::RegistrationsController
  include RackSessionFix
  respond_to :json
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def create
    @user = User.new(sign_up_params)
  
    if @user.save
    token = @user.generate_jwt
      render json: 'User Created'
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :id_number, :admin)
  end

  def respond_with(resource, _opts = {})

  if resource.persisted?
    render json: {
      status: {code: 200, message: 'Signed up successfully.'},
      data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
    }
  else
    render json: {
      status: { code: 422, message: "Sign-up unsuccessful. #{resource.errors.full_messages.to_sentence}" },
    }, status: :unprocessable_entity
    


  end
  end
end
