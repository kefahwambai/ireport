class InterventionsController < ApplicationController
  load_and_authorize_resource  
  before_action :set_user

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
    @intervention = Intervention.new(intervention_params)
    @intervention.government_agency_id = params[:government_agency_id]
  
    if @intervention.save
      render json: @intervention, status: :created
    else
      render json: @intervention.errors, status: :unprocessable_entity
    end
  end
  


    # PATCH/PUT /interventions/1

  def update
    @user = current_user

    @intervention = @user.interventions.find_by(id: params[:id])

    if @intervention.nil?
      render json: { error: 'Intervention not found' }, status: :not_found
    else
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
    if @intervention.user_id == current_user.id
      @intervention.destroy
      render json: { message: "Intervention deleted successfully" }
    else
      render json: { error: "You don't have permission to delete this Intervention" }, status: :forbidden
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
 
