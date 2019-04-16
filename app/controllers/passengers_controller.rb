class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all.order(:id)
  end
    
  def show
    @passenger = Passenger.find_by(id: params[:id])
    @trips = @passenger.trips
  end
    
      







end
