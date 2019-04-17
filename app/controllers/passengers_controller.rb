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
      render :new
    end
  end

  def edit
    @passenger = Passenger.find_by(id: params[:id])
  end

  def update
    passenger = Passenger.find(params[:id])
    is_successful= passenger.update(passenger_params)

    if is_successful
      redirect_to passengers_path
    else
      @passenger = passenger
      render :edit
    end
  end

  def destroy
    passenger = Passenger.find_by(id: params[:id])
    passenger.destroy

    redirect_to passengers_path
  end

  private

  def passenger_params
    return params.require(:passenger).permit(:name, :phone_number)
  end


end
