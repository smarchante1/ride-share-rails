class TripsController < ApplicationController
  def show
    @trip = Trip.find_by(id: params[:id])
    if @trip.nil?
      head :not_found
    end
  end

  def new
    @trip = Trip.new
  end

  def create
    #find passenger
    passenger = Passenger.find_by(id: params[:passenger_id])
    driver = Driver.all.shuffle.first
    #find driver
    @trip = Trip.new(
      passenger: passenger,
      driver: driver,
      date: Time.now.strftime("%Y-%d-%m"),
      cost: rand(200..10000), #random number between 200 - 10000 cents (2-100 dollars)
    )

    is_successful = @trip.save

    if is_successful
      redirect_to passenger_path(passenger.id)
    else
      render :new
    end
  end

  private

  def trip_params
    return params.require(:trip).permit(:cost, :date, :driver_id, :passenger_id)
  end
end

#     def create
#       @driver = Driver.new(driver_params)
#       is_successful = @driver.save

#       if is_successful
#         redirect_to drivers_path
#       else
#         @driver = driver
#         render :new
#       end
#     end

#     def edit
#       @driver = Driver.find_by(id: params[:id])
#     end

#     def update
#       driver = Driver.find(params[:id])
#       is_successful = driver.update(driver_params)
#       if is_successful
#         redirect_to drivers_path
#       else
#         @driver = driver
#         render :edit
#       end
#     end

#     def destroy
#       driver = Driver.find_by(id: params[:id])
#       driver.destroy
#       redirect_to drivers_path
#     end

#     private

#     def driver_params
#       return params.require(:driver).permit(:name, :vin)
#     end
#   end
