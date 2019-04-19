

class TripsController < ApplicationController
  def show
    @trip = Trip.find_by(id: params[:id])
    unless !@trip.nil?
      redirect_to trips_path
    end
  end

  def new
    @trip = Trip.new
  end

  def create
    passenger = Passenger.find_by(id: params[:trip][:passenger_id])
    driver = Driver.find_by(status: true)
    @trip = Trip.new(
      passenger: passenger,
      driver: driver,
      date: Time.now.strftime("%Y-%d-%m"),
      cost: rand(200..10000),
    )

    is_successful = @trip.save

    if is_successful
      driver.status = false 
      driver.save
      redirect_to passenger_path(@trip.passenger_id)
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find_by(id: params[:id])

    redirect_to trips_path if @trip.nil?
  end

  def update
    trip = Trip.find(params[:id])
    is_successful = trip.update(trip_params)

    if is_successful
      redirect_to passenger_path(trip.passenger_id)
    else
      redirect_to trips_path
    end
  end

  def destroy
    trip = Trip.find_by(id: params[:id])

    if trip.nil?
      head :not_found
    else
      trip.destroy
      redirect_to trips_path
    end
  end

  private

  def trip_params
    return params.require(:trip).permit(:cost, :date, :driver_id, :passenger_id, :rating)
  end
end
