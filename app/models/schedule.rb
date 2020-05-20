class Schedule < ApplicationRecord
  
  #validates_presence_of :start, :end
  belongs_to :doctor
  has_many :bookings

end
