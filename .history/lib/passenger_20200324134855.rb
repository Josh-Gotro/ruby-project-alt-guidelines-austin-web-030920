class Passenger < ActiveRecord::Base
    belongs_to :ride
    has_many :visists
end