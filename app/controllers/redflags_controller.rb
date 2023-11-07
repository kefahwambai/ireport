class RedflagsController < ApplicationController  
  load_and_authorize_resource  
  before_action :set_user, only: :index


  # GET /redflags
  def index
    if @user
      @redflags = @user.redflags
    else
      @redflags = Redflag.all
    end

    render json: @redflags
  end

  # GET /redflags/1
  def show
    render json: @redflag
  end

  # POST /redflags
  def create
    @redflag = Redflag.new(redflag_params)

    if @redflag.save
      render json: @redflag, status: :created, location: @redflag
    else
      render json: @redflag.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /redflags/1
  # PATCH/PUT /redflags/1
  def update
    @user = current_user

    @redflag = @user.redflags.find_by(id: params[:id])

    if @redflag.nil?
      render json: { error: 'Redflag not found' }, status: :not_found
    else
      if @redflag.update(status: params[:status])
        render json: @redflag
      else
        render json: @redflag.errors, status: :unprocessable_entity
      end
    end
  end


  # DELETE /redflags/1
  def destroy
    @redflag = Redflag.find(params[:id])
    if @redflag.user_id == current_user.id
      @redflag.destroy
      render json: { message: "Redflag deleted successfully" }
    else
      render json: { error: "You don't have permission to delete this redflag" }, status: :forbidden
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_redflag
      @redflag = Redflag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def redflag_params
      params.permit(:title, :description, :status, :user_id, :location)
    end

    def set_user
      @user = User.find(params[:user_id]) if params[:user_id].present? && request.get?
    end
    
end
