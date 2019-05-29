require "pry"
class Api::V1::BreaksController < ApplicationController


  # GET /breaks

  def index

    @breaks = get_current_user.managers.map{|manager| manager.breaks }.flatten




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
      render json: @break, status: :created, location: api_v1_break_url(@break)
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
    @break = Break.find(params[:id])
    @break.destroy
    render json: @break
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_break
      @break = Break.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def break_params
      params.require(:breaks).permit(:breakdate, :breaketime, :breakend, :user_id, :employee_id)
    end
end
