 module Api::V1
class BreaksController < ApplicationController
  before_action :set_break, only: [:show, :update, :destroy]

  # GET /breaks
  def index
    @breaks = Break.all

    render json: @breaks
  end

  # GET /breaks/1
  def show
    render json: @break
  end

  # POST /breaks
  def create
    @break = Break.new(break_params)

    if @break.save
      render json: @break, status: :created, location: @break
    else
      render json: @break.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /breaks/1
  def update
    if @break.update(break_params)
      render json: @break
    else
      render json: @break.errors, status: :unprocessable_entity
    end
  end

  # DELETE /breaks/1
  def destroy
    @break.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_break
      @break = Break.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def break_params
      params.require(:break).permit(:breakdate, :breaktime, :user_id, :employee_id)
    end
end
end
