require "pry"
class EmployeesController < ApplicationController


  # GET /employees
  def index
    @employees = get_current_user.employees


    render json: @employees
  end

  # GET /employees/1
  def show
    render json: @employee
  end

  # POST /employees
  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      render json: @employee, status: :created, location: api_v1_employee_url(@employee)
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /employees/1
  def update
    if @employee.update(employee_params)
      render json: @employee
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  # DELETE /employees/1
  def destroy
    @employee = Employee.find(params[:id])

    @employee.destroy
    render json: @employee
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def employee_params
      params.require(:employee).permit(:employeename, :user_id, :company_id, :manager_id)
    end
end
