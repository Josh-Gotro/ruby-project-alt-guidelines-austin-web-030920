class Passenger < ActiveRecord::Base
    has_many :rides
    has_many :visits
    has_many :drivers, through: :rides
    has_many :services, through: :visits

    def self.call_ride
        current_ride = Ride.create
        current_ride.driver_id = Driver.random_driver_by_zip(78704).id
        # current_ride.passenger_id = self.passebger_id
        # current_ride.driver_id = Driver.random_driver_by_zip(78704)
        puts current_ride
        #use random driver
        #address of service
        #attach self to ride
    end
end

# def update_drivers
#     ONLINE = [true, false]
#     Drivers.all.each do |driver|
#         driver.update(zip_code: ZIPCODE.sample)
#         driver.update(online?: ONLINE.sample)
#     end
# end

    