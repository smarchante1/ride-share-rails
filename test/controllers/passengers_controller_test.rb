require "test_helper"

describe PassengersController do
  let (:passenger) {
    Passenger.create name: "Sample Passenger", phone_number: "123-456-7890"
  }
  describe "index" do
    it "can get index" do
      # Act
      get passengers_path

      # Assert
      must_respond_with :success
    end
  end

  describe "show" do
    it "can get a valid passenger" do

      # Act
      get passenger_path(passenger.id)

      # Assert
      must_respond_with :success
    end
    it "will redirect for an invalid passenger" do

      # Act
      get passenger_path(-1)

      # Assert
      must_respond_with :redirect
    end
  end

  describe "edit" do
    it "can get the edit page for an existing passenger" do

      # Act
      get edit_passenger_path(passenger.id)

      # Assert
      must_respond_with :success
    end
    it "will respond with redirect when attempting to edit a nonexistant passenger" do #add redirect

      # Arrange
      id = -1
      # Act
      get edit_passenger_path(id)

      # Assert
      must_respond_with :redirect
    end
  end

  describe "update" do
    it "can update an existing passenger" do
      # Arrange
      passenger_hash = {
        passenger: {
          name: "Another Sample",
          phone_number: "222-222-2222",
        },
      }

      # Act
      patch passenger_path(passenger.id), params: passenger_hash
      passenger.reload 

      # Assert
      expect(passenger.name).must_equal "Another Sample"
    end

    it "will redirect to the root page if not updated successfully" do

      # Arrange
      passenger_hash = {
        passenger: {
          passenger_name: "Sample Three",
          phone_number: "333-333-3333",
        },
      }

      # Act
      patch passenger_path(passenger.id), params: passenger_hash
      # do not get new data from database using passenger.reload to simulate failing to save the changes

      # Assert
      must_respond_with :redirect
    end
  end

  describe "new" do
    it "can get the new passenger page" do

      # Act
      get new_passenger_path

      # Assert
      must_respond_with :success
    end
  end

  describe "create" do
    it "can create a new passenger" do

      # Arrange
      passenger_hash = {
        passenger: {
          name: "Sample Four",
          phone_number: "444-444-4444",
        },
      }

      # Act-Assert
      expect {
        post passengers_path, params: passenger_hash
      }.must_change "Passenger.count", 1

      new_passenger = Passenger.find_by(name: passenger_hash[:passenger][:name])
      expect(new_passenger.name).must_equal passenger_hash[:passenger][:name]
      expect(new_passenger.phone_number).must_equal passenger_hash[:passenger][:phone_number]

      must_respond_with :redirect
      must_redirect_to passengers_path 
    end
  end

  describe "destroy" do
    it "can delete a passenger" do
      # Arrange
      new_passenger = Passenger.create(name: "Sample Four", phone_number: "444-444-4444")

      expect {
        # Act
        delete passenger_path(new_passenger.id)
        # Assert
      }.must_change "Passenger.count", -1

      must_respond_with :redirect
      must_redirect_to passengers_path
    end

    it "responds with a not found error if driver id is invalid" do
      # Arrange
      id = -1

      # Act
      delete passenger_path(id)

      # Assert
      must_respond_with :not_found
    end
  end
end
