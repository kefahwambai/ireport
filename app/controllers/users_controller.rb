class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  # skip_before_action :authorized_user, only: :create
 

  def index
    render json: User.all, status: :ok
  end

  def show
    render json: current_user, status: :ok
  end  

  def create
    user = User.create!(user_params)
    token = AuthenticationTokenService.encode(user.id)
    render json: { token: token }, status: :created
  end


  def destroy
    user = User.find(params[:id])
    if user.destroy
      render json: { message: 'User deleted successfully' }
    else
      render json: { errors: 'Failed to delete user!' }, status: :unprocessable_entity
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :id_number, :admin)
    end
    
end
