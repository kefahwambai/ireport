class RedflagsController < ApplicationController  
  before_action :authenticate_request!
  load_and_authorize_resource  
  


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
    puts "Received POST request for Redflag with parameters: #{redflag_params}"

    # current_user!
    @redflag = current_user.redflags.build(redflag_params)

    if @redflag.save
      render json: @redflag, status: :created, location: @redflag
    else
      render json: @redflag.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /redflags/1
  # PATCH/PUT /redflags/1
  def update
    @redflag = current_user.redflags.find_by(id: params[:id])
  
    if @redflag.nil?
      render json: { error: 'Redflag not found' }, status: :not_found
    else
      authorize! :update, @redflag
  
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
  
    authorize! :destroy, @redflag
  
    if @redflag.user_id == current_user.id
      @redflag.destroy
      render json: { message: "Redflag deleted successfully" }
    else
      render json: { error: "You don't have permission to delete this redflag" }, status: :forbidden
    end
  end
  

  private

    # def authenticate_user!
    #   current_user || render_unauthorized
    # end

    # def render_unauthorized
    #   render json: { error: 'You need to log in first' }, status: :unauthorized
    # end
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
