class GovernmentAgenciesController < ApplicationController
  before_action :authenticate_request!
  load_and_authorize_resource
  # before_action :set_user
  
  # GET /government_agencies
  def index
    @government_agencies = GovernmentAgency.all

    render json: @government_agencies
  end

  # GET /government_agencies/1
  def show
    render json: @government_agency
  end

  # POST /government_agencies
  def create
    @government_agency = GovernmentAgency.new(government_agency_params)

    if @government_agency.save
      render json: @government_agency, status: :created, location: @government_agency
    else
      render json: @government_agency.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /government_agencies/1
  def update
    if @government_agency.update(government_agency_params)
      render json: @government_agency
    else
      render json: @government_agency.errors, status: :unprocessable_entity
    end
  end

  # DELETE /government_agencies/1
  def destroy
    @government_agency.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_government_agency
      @government_agency = GovernmentAgency.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def government_agency_params
      params.require(:government_agency).permit(:name)
    end
end
