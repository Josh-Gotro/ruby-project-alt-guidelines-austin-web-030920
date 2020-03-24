class Passenger < ActiveRecord::Base
    has_many :rides
    has_many :visits
    has_many :drivers, through: :ride
    has_many :services, through: :visit 
end