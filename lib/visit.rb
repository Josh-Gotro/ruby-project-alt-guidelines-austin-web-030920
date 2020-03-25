class Visit < ActiveRecord::Base
    belongs_to :passenger
    belongs_to :service
    belongs_to :ride
end