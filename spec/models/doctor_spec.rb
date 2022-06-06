require 'rails_helper'

RSpec.describe Doctor do
  describe 'relationships' do
    it { should belong_to(:hospital) }
    it { should have_many(:doctor_patients) }
    it { should have_many(:patients).through(:doctor_patients) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :specialty }
    it { should validate_presence_of :university }
  end

  let!(:hospital1) { Hospital.create!(name: 'U of Utah Medical School Hospital') }
  let!(:hospital2) { Hospital.create!(name: 'Intermountain Healthcare') }

  let!(:doctor1) { hospital1.doctors.create!(name: 'Dr. Rose Zheng', specialty: 'OBGYN', university: 'U of Utah Medical School') }
  let!(:doctor2) { hospital1.doctors.create!(name: 'Dr. Ellen Chang', specialty: 'Family Medicine', university: 'NYU School of Medicine') }
  let!(:doctor3) { hospital2.doctors.create!(name: 'Dr. Jesse Alba', specialty: 'Internal Medicine', university: 'KU Med') }

  describe '#num_doctors_per_hospital' do
    it "counts the number of doctors at a hospital" do
      expect(hospital1.num_doctors_per_hospital).to eq(2)
    end
  end
end
