require "pry"
class CompaniesController < ApplicationController


  # GET /companies
  def index
    @companies = get_current_user.companies




    render json: @companies
  end

  # GET /companies/1
  def show
    render json: @company
  end

  # POST /companies
  def create
    @company = Company.new(company_params)

    if @company.save
      render json: @company, status: :created, location: api_v1_company_url(@company)
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /companies/1
  def update
    if @company.update(company_params)
      render json: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # DELETE /companies/1
  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    render json: @company
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = company.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def company_params
      params.require(:company).permit(:companyname, :user_id)
    end
end
