require "test_helper"

describe DriversController do
  let (:driver) {
    Driver.create name: "Sample Driver", vin: "11111111111111111"
  }
  describe "index" do
    it "can get index" do
      # Act
      get drivers_path

      # Assert
      must_respond_with :success
    end
  end

  # describe "show" do # add redirect to show
  ##check out divided by 0 error
  # it "can get a valid driver" do

  #   # Act
  #   get driver_path(driver.id)

  #   # Assert
  #   must_respond_with :success
  # end
  # it "will redirect for an invalid driver" do # add redirect to show

  #   # Act
  #   get driver_path(-1)

  #   # Assert
  #   must_respond_with :redirect
  # end
  # end

  describe "edit" do
    it "can get the edit page for an existing driver" do

      # Act
      get edit_driver_path(driver.id)

      # Assert
      must_respond_with :success
    end
    # it "will respond with redirect when attempting to edit a nonexistant driver" do #add redirect

    #   # Arrange
    #   id = -1
    #   # Act
    #   get edit_driver_path(id)

    #   # Assert
    #   must_respond_with :redirect
    # end
  end

  describe "update" do
    it "can update an existing driver" do
      # Arrange
      driver_hash = {
        driver: {
          name: "Another Sample",
          vin: "22222222222222222",
        },
      }

      # Act
      patch driver_path(driver.id), params: driver_hash
      driver.reload #use .reload to access database again (fresh data)

      # Assert
      expect(driver.name).must_equal "Another Sample"
    end

    it "will redirect to the root page if not updated successfully" do

      # Arrange
      driver_hash = {
        driver: {
          driver_name: "Sample Three",
          vin: "33333333333333333",
        },
      }

      # Act
      patch driver_path(driver.id), params: driver_hash
      # do not get new data from database using driver.reload to simulate failing to save the changes

      # Assert
      must_respond_with :redirect
    end
  end

  describe "new" do
    it "can get the new driver page" do

      # Act
      get new_driver_path

      # Assert
      must_respond_with :success
    end
  end

  describe "create" do
    it "can create a new driver" do

      # Arrange
      driver_hash = {
        driver: {
          name: "Sample Four",
          vin: "444444444444444444",
        },
      }

      # Act-Assert
      expect {
        post drivers_path, params: driver_hash
      }.must_change "Driver.count", 1

      new_driver = Driver.find_by(name: driver_hash[:driver][:name])
      expect(new_driver.name).must_equal driver_hash[:driver][:name]
      expect(new_driver.vin).must_equal driver_hash[:driver][:vin]

      must_respond_with :redirect
      must_redirect_to drivers_path #change this if we decide to redirect elsewhere
    end
  end

  describe "destroy" do
    it "can delete a driver" do
      # Arrange
      new_driver = Driver.create(name: "Sample Four", vin: "44444444444444444")

      expect {
        # Act
        delete driver_path(new_driver.id)
        # Assert
      }.must_change "Driver.count", -1

      must_respond_with :redirect
      must_redirect_to drivers_path
    end
    # it "responds with a not found error if driver id is invalid" do ##need a redirect in show
    #   # Arrange
    #   id = -1

    #   # Act
    #   delete driver_path(id)

    #   # Assert
    #   must_respond_with :not_found
    # end
  end
end
