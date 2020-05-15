class Clinic < ApplicationRecord
  
  validates_presence_of :start, :end, :clinic_address, :phone_no, :city, :state
  belongs_to :doctor

end
