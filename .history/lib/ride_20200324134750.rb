class Ride < ActiveRecord::Base
    has_many :driver
    has_many :passenger
end