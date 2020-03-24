class Ride < ActiveRecord::Base
    has_many :drivers
    has_many :passengers
end