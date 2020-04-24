class Doctor < ApplicationRecord
  validates :user_id, uniqueness: true
  belongs_to :user
  belongs_to :category
  has_many :clinics, dependent: :destroy
  has_many :schedules, dependent: :destroy
  has_many :bookings, dependent: :destroy

  def self.search(search)
    if search
      where(["first_name LIKE ?","%#{search}%"])
    else
      all
    end

  end

end
