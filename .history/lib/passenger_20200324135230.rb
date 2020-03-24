class Passenger < ActiveRecord::Base
    belongs_to :ride
    has_many :visits
    has_many :drivers, through: :ride
end