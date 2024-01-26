class InterventionsController < ApplicationController
  before_action :authenticate_request!
  load_and_authorize_resource
  
  # GET /interventions
  def index
   

    if @user
      @interventions = @user.interventions
      render json: @interventions
    else
      @interventions = Intervention.all
      render json: @interventions
    end
  end

  # GET /interventions/1
  def show
    render json: @intervention
  end

  # POST /interventions
  def create
    @intervention = current_user!.posts.build(intervention_params)
    @intervention.government_agency_id = params[:government_agency_id]
  
    if @intervention.save
      render json: @intervention, status: :created
    else
      render json: @intervention.errors, status: :unprocessable_entity
    end
  end
  


    # PATCH/PUT /interventions/1

  def update
    @intervention = current_user.interventions.find_by(id: params[:id])
  
    if @intervention.nil?
      render json: { error: 'Intervention not found' }, status: :not_found
    else
      authorize! :update, @intervention
  
      if @intervention.update(status: params[:status])
        render json: @intervention
      else
        render json: @intervention.errors, status: :unprocessable_entity
      end
    end
  end
    




  # DELETE /interventions/1
  def destroy
    @intervention = Intervention.find(params[:id])
  
    authorize! :destroy, @intervention
  
    if @intervention.user_id == current_user.id
      @intervention.destroy
      render json: { message: "Intervention deleted successfully" }
    else
      render json: { error: "You don't have permission to delete this intervention" }, status: :forbidden
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intervention
      @intervention = Intervention.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intervention_params
      params.permit( :government_agency_id, :title, :description, :status, :user_id, :image, :location)
    end

    def set_user
      @user = User.find(params[:user_id]) if params[:user_id].present?
    end
    
end
 
