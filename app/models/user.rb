class User < ApplicationRecord
  enum role: [:patient, :doctor, :admin]
	after_initialize :set_default_role, :if => :new_record?

	def set_default_role
		self.role ||= :patient
  end
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :doctors, dependent: :destroy
  has_many :patients, dependent: :destroy
end
