class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients
  has_many :hospitals, through: :doctors

  validates_presence_of :name, :age
end
