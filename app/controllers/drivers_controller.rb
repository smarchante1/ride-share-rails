class DriversController < ApplicationController
  def index
    @drivers = Driver.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    driver_id = params[:id]
    @driver = Driver.find_by(id: driver_id)

    if @driver.nil?
      redirect_to drivers_path
    end
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)
    is_successful = @driver.save

    if is_successful
      redirect_to drivers_path
    else
      render :new
    end
  end

  def edit
    @driver = Driver.find_by(id: params[:id])

    if @driver.nil?
      redirect_to drivers_path
    end
  end

  def update
    driver = Driver.find(params[:id])
    is_successful = driver.update(driver_params)
    if is_successful
      redirect_to drivers_path
    else
      @driver = driver
      render :edit
    end
  end

  def destroy
    driver = Driver.find_by(id: params[:id])

    if driver.nil?
      head :not_found
    else
      driver.destroy
      redirect_to drivers_path
    end
  end

  private

  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end
end
