class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all.order(:id)
  end
    
  def show
    @passenger = Passenger.find_by(id: params[:id])
    @trips = @passenger.trips
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
      @passenger = passenger
      render :new
    end
  end

  

  private

  def passenger_params
    return params.require(:passenger).permit(:name, :phone_number)
  end


end
