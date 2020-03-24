class Passenger < ActiveRecord::Base
    has_many :rides
    has_many :visits
    has_many :drivers, through: :rides
    has_many :services, through: :visits
end

def call_ride
    Drivers.all.each do |driver|
        driver.update(zip_code: ZIPCODE.sample)
        driver.update(online?: )
    end