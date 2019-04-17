class TripsController < ApplicationController
  # def index
  # if params[:passenger_id] #if not nil
  #   @trips = Trip.where(passenger_id: Passenger.find_by(id: params[:passenger_id])) #find trips from that passenger
  # else
  #   # params[:driver_id]
  #   @trips = Trip.where(driver_id: Driver.find_by(id: params[:driver_id])) #find trips from that driver
  #   # else
  #   #   @trip= Trip.all.order(:title)
  # end
  # end

  def show
    @trip = Trip.find_by(id: params[:id])
    # if @trip.nil?
    #   head :not_found
    # end
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

  def edit
    @trip = Trip.find_by(id: params[:id])
  end

  def update
    trip = Trip.find(params[:id])
    is_successful = trip.update(trip_params)

    if is_successful
      redirect_to passenger_path(trip.passenger_id)
    else
      render :edit
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
    return params.require(:trip).permit(:cost, :date, :driver_id, :passenger_id)
  end
end
