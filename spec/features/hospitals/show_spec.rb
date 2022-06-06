# As a visitor
# When I visit a hospital's show page
# I see the hospital's name
# And I see the number of doctors that work at this hospital
# And I see a unique list of universities that this hospital's doctors attended

require 'rails_helper'

RSpec.describe 'Hospitals Show Page' do

  let!(:hospital1) { Hospital.create!(name: 'U of Utah Medical School Hospital') }
  let!(:hospital2) { Hospital.create!(name: 'Intermountain Healthcare') }

  let!(:doctor1) { hospital1.doctors.create!(name: 'Dr. Rose Zheng', specialty: 'OBGYN', university: 'U of Utah Medical School') }
  let!(:doctor2) { hospital1.doctors.create!(name: 'Dr. Ellen Chang', specialty: 'Family Medicine', university: 'NYU School of Medicine') }
  let!(:doctor3) { hospital2.doctors.create!(name: 'Dr. Jesse Alba', specialty: 'Internal Medicine', university: 'KU Med') }

  let!(:patient1) { Patient.create!(name: 'Pepe Hernandez', age: '29') }
  let!(:patient2) { Patient.create!(name: 'Preeti Singh', age: '35') }
  let!(:patient3) { Patient.create!(name: 'Randy Jones', age: '14') }

  let!(:doctor_patient1) { DoctorPatient.create!(doctor_id: doctor1.id, patient_id: patient1.id) }
  let!(:doctor_patient2) { DoctorPatient.create!(doctor_id: doctor1.id, patient_id: patient2.id) }
  let!(:doctor_patient3) { DoctorPatient.create!(doctor_id: doctor2.id, patient_id: patient3.id) }

  before do
    visit hospital_path(hospital1)
  end

  it "displays a hospital's name and the number of doctors that work at this hospital" do
    expect(page).to have_content('U of Utah Medical School Hospital')
    expect(page).to have_content('Number of Doctors: 2')
    expect(page).to_not have_content('Intermountain Healthcare')
  end

  it "displays a unique list of universities that this hospital's doctors attended" do
    expect(page).to have_content('U of Utah Medical School')
    expect(page).to have_content('NYU School of Medicine')
    expect(page).to_not have_content('KU Med')
  end
end
