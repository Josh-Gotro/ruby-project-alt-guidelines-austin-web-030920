class Passenger < ActiveRecord::Base
    belongs_to :ride
    has_many :visits
    has_many :drivers, through: :ride
    has_many :services, through: :visit 
end