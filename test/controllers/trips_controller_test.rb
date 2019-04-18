require "test_helper"

describe TripsController do
  before do
    passenger = Passenger.new(name: "Sample Passenger", phone_number: "123-456-7890")
    passenger.save
    driver = Driver.new(name: "Sample Driver", vin: "11111111111111111")
    driver.save
    t = Trip.new(passenger_id: passenger.id, driver_id: driver.id, date: Time.now.strftime("%Y-%d-%m"), cost: 13.0, rating: 3)
    t.save
  end

  describe "show" do
    it "can show page for a valid trip" do
      trip_id = Trip.last.id

      get passenger_path(trip_id)

      must_respond_with 302
    end
     
    it " returns a 302 redirect for invalid trip id" do
      get passenger_path(-1)

      must_respond_with 302
    end

  end


  describe "create" do
    it "should create a new trip" do
      date = "April 19th 2019"
      cost = 2042
      rating = nil

      trip_hash = {
        trip: {
          date: date,
          cost: cost,
          passenger_id: Passenger.last.id,
          driver_id: Driver.last.id
        }
      }
 
      expect {
        post trips_path params: trip_hash
      }.must_change 'Trip.count', 1

      new_trip = Trip.last
      expect(new_trip).wont_be_nil
      expect(new_trip.rating).must_equal nil

      must_respond_with :redirect
    end

    it "returns an error for and invalid trip" do
      date = ""
      cost = 2042
      rating = nil

      invalid_trip = {
        trip: {
          date: date,
          cost: cost,
          passenger_id: 0,
          driver_id: 1
        }
      }
 
      expect {
        post trips_path, params: invalid_trip
      }.wont_change 'Trip.count'
    end
  end

  describe "edit" do
    it "should edit trip" do
      get edit_trip_path(Trip.first.id)

      must_respond_with :success
    end

    it "should respond with 404 if the trip doesn't exist" do
      get edit_trip_path(-1)

      must_respond_with :not_found
    end
  end

  describe "update" do
    # Your tests go here
  end

  describe "destroy" do
    # Your tests go here
  end
end
