class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :showSupplies, :update, :destroy]

  # GET /pins
  # GET /pins.json
  def index
    @pins = Pin.all
    render json: @pins
  end

  # GET /pins/1
  # GET /pins/1.json
  def show
    render json: @pin
  end

  def showSupplies
    render json: @pin.supplies
  end

  # POST /pins
  # POST /pins.json
  def create
    @pin = Pin.new(pin_params)

    if @pin.save
      render :show, status: :created, location: @pin
    else
      render json: @pin.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pins/1
  # PATCH/PUT /pins/1.json
  def update
    if @pin.update(pin_params)
      render :show, status: :ok, location: @pin
    else
      render json: @pin.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pins/1
  # DELETE /pins/1.json
  def destroy
    @pin.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.fetch(:pin, {}).permit(:name, :classification, :latitude, :longitude)
    end
end
