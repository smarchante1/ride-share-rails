class DriversController < ApplicationController
  def index
    @drivers = Driver.all.order(:id)
  end

  def show
    driver_id = params[:id]
    @driver = Driver.find_by(id: driver_id)
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)
    @driver.save
    redirect_to drivers_path
  end

  def edit
    @driver = Driver.find_by(id: params[:id])
  end

  def update
    driver = Driver.find(params[:id])
    driver.update(driver_params)
    redirect_to drivers_path
  end

  private

  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end
end
