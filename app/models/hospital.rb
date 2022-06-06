class Hospital < ApplicationRecord
  has_many :doctors
  has_many :doctor_patients, through: :doctors
  has_many :patients, through: :doctor_patients

  validates :name, presence: true

  def num_doctors_per_hospital
    self.doctors.count
  end
end
