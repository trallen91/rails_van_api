class Driver < ActiveRecord::Base
  has_many :rides, class_name: :Ride
end
