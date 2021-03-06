class ManagersController < ApplicationController


  # GET /managers
  def index
    @managers = get_current_user.managers

    render json: @managers
  end

  # GET /managers/1
  def show
    render json: @manager
  end

  # POST /managers
  def create
    @manager = Manager.new(manager_params)

    if @manager.save
      render json: @manager, status: :created, location: api_v1_manager_url(@manager)
    else
      render json: @manager.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /managers/1
  def update
    if @manager.update(manager_params)
      render json: @manager
    else
      render json: @manager.errors, status: :unprocessable_entity
    end
  end

  # DELETE /managers/1
  def destroy
    @manager = Manager.find(params[:id])
    @manager.destroy
    render json: @manager
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manager
      @manager = Manager.find(params[:id])
    end

    # Only allow a trusted parameter
    def manager_params
      params.require(:manager).permit(:managername, :user_id, :company_id)
    end
end
