class Service < ActiveRecord::Base
    has_many :visits
    has_many :passengers, through: :visits
end