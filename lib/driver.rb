class Driver < ActiveRecord::Base
    has_many :rides
    has_many :passengers, through: :rides



    # provides an array of all zipcodes of drivers
    def self.driver_zipcodes
        driver_zips = []
        Driver.find_each do |driver|
            driver_zips << driver.zip_code
        end
    driver_zips
    end
        
    #returns a random driver from zipcode provided
    def self.random_driver_by_zip(zipcode)
        drivers = []
        Driver.find_each do |driver|
            if driver.zip_code == zipcode
                drivers << driver
            end
        end
    drivers.sample
    end

end

