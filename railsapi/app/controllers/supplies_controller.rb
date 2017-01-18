class SuppliesController < ApplicationController
  before_action :set_supply, only: [:show, :showPins, :update, :destroy]

  # GET /supplies
  # GET /supplies.json
  def index
    @supplies = Supply.all
    render json: @supplies
  end

  # GET /supplies/1
  # GET /supplies/1.json
  def show
    render json: @supply
  end

  def showPins
    render json: @supply.pins
  end

  # POST /supplies
  # POST /supplies.json
  def create
    @supply = Supply.new(supply_params)

    if @supply.save
      render :show, status: :created, location: @supply
    else
      render json: @supply.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /supplies/1
  # PATCH/PUT /supplies/1.json
  def update
    if @supply.update(supply_params)
      render :show, status: :ok, location: @supply
    else
      render json: @supply.errors, status: :unprocessable_entity
    end
  end

  # DELETE /supplies/1
  # DELETE /supplies/1.json
  def destroy
    @supply.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supply
      @supply = Supply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supply_params
      params.fetch(:supply, {}).permit(:name, :category)
    end
end
