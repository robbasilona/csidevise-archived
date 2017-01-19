class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :update, :destroy]

  # GET /stocks
  # GET /stocks.json
  def index
    @stocks = Stock.all
    render json: @stocks
  end

  # GET /stocks/1
  # GET /stocks/1.json
  def show
    render json: @stock
  end

  # POST /stocks
  # POST /stocks.json
  def create
    @stock = Stock.new(stock_params)

    if @stock.save
      render :show, status: :created, location: @stock
    else
      render json: @stock.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stocks/1
  # PATCH/PUT /stocks/1.json
  def update
    if @stock.update(stock_params)
      render :show, status: :ok, location: @stock
    else
      render json: @stock.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stocks/1
  # DELETE /stocks/1.json
  def destroy
    @stock.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_params
      params.fetch(:stock, {}).permit(:quantity, :pin_id, :supply_id)
    end
end
