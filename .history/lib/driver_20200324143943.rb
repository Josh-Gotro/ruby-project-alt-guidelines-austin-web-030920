class Driver < ActiveRecord::Base
    has_many :rides
    has_many :passengers, through: :rides

    # def initialize

    # end
end