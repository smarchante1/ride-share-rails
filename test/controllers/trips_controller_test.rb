require "test_helper"

describe TripsController do
  describe "show" do
    # it "can get a passenger's trip" do

    #   # Act
    #   # get passenger_path(passenger.id)
    #   # change path name

    #   # Assert
    #   must_respond_with :success
    # end
  end

  describe "edit" do
    it "can get the edit page for an existing passenger's trip" do

      # Act
      # get edit_passenger_path(passenger.id)
      # change path

      # Assert
      must_respond_with :success
    end

      # it "will respond with redirect when attempting to edit a nonexistant passenger" do #add redirect

    #   # Arrange
    #   id = -1
    #   # Act
    #   #get edit_passenger_path(id)
    #   #change path name 

    #   # Assert
    #   must_respond_with :redirect
    # end
  end

  describe "update" do
    # Your tests go here
  end

  describe "create" do
    # Your tests go here
  end

  describe "destroy" do
    # Your tests go here
  end
end
