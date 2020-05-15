class Doctor < ApplicationRecord
  
  validates :user_id, uniqueness: true
  validates_presence_of :first_name, :last_name, :address, :city, :state, :country,
                        :pincode, :dob
  belongs_to :user
  belongs_to :category
  has_many :clinics, dependent: :destroy
  has_many :schedules, dependent: :destroy
  has_many :bookings, dependent: :destroy
  before_save :downcase_name

  def self.search(search)
    if search
      where(["first_name LIKE ?","%#{search}%"])
    else
      all
    end

  end

  def downcase_name
    self.first_name.downcase!
    self.last_name.downcase!
  end

end
