class PassengersController < ApplicationController
  def index
    @passengers = Passenger.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @passenger = Passenger.find_by(id: params[:id])
    # @trips = @passenger.trips # was making test fail

    if @passenger.nil?
      redirect_to passengers_path
    end
  end

  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(passenger_params)
    is_successful = @passenger.save

    if is_successful
      redirect_to passengers_path
    else
      render :new
    end
  end

  def edit
    @passenger = Passenger.find_by(id: params[:id])

    if @passenger.nil?
      redirect_to drivers_path
    end
  end

  def update
    passenger = Passenger.find(params[:id])
    is_successful = passenger.update(passenger_params)

    if is_successful
      redirect_to passengers_path
    else
      @passenger = passenger
      render :edit
    end
  end

  def destroy
    passenger = Passenger.find_by(id: params[:id])

    if passenger.nil?
      head :not_found
    else
      passenger.destroy
      redirect_to passengers_path
    end
  end

  private

  def passenger_params
    return params.require(:passenger).permit(:name, :phone_number)
  end
end
