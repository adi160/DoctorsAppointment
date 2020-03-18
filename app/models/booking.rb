class Booking < ApplicationRecord
  belongs_to :schedule
  belongs_to :doctor
  belongs_to :patient
end
