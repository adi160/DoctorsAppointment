class Doctor < ApplicationRecord
  belongs_to :user
  # belongs_to :category
  has_many :clinics, dependent: :destroy
  has_many :schedules, dependent: :destroy
  has_many :bookings, dependent: :destroy

end
