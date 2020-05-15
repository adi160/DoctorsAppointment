class Patient < ApplicationRecord
  
  validates_presence_of :first_name, :last_name, :address, :city, :state, :phone_no,
                        :pincode, :age, :sex
  belongs_to :user
  has_many :bookings, dependent: :destroy

end
