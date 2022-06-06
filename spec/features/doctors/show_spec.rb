require 'rails_helper'

RSpec.describe 'Doctors Show Page' do

  let!(:hospital1) { Hospital.create!(name: 'U of Utah Medical School Hospital') }
  let!(:hospital2) { Hospital.create!(name: 'Intermountain Healthcare') }

  let!(:doctor1) { hospital1.doctors.create!(name: 'Dr. Rose Zheng', specialty: 'OBGYN', university: 'U of Utah Medical School') }
  let!(:doctor2) { hospital2.doctors.create!(name: 'Dr. Ellen Chang', specialty: 'Family Medicine', university: 'NYU School of Medicine') }

  let!(:patient1) { Patient.create!(name: 'Pepe Hernandez', age: '29') }
  let!(:patient2) { Patient.create!(name: 'Preeti Singh', age: '35') }
  let!(:patient3) { Patient.create!(name: 'Randy Jones', age: '14') }

  let!(:doctor_patient1) { DoctorPatient.create!(doctor_id: doctor1.id, patient_id: patient1.id) }
  let!(:doctor_patient2) { DoctorPatient.create!(doctor_id: doctor1.id, patient_id: patient2.id) }
  let!(:doctor_patient3) { DoctorPatient.create!(doctor_id: doctor2.id, patient_id: patient3.id) }

  before do
    visit doctor_path(doctor1)
  end

  it "displays all of that doctor's attributes" do
    expect(page).to have_content('Dr. Rose Zheng')
    expect(page).to have_content('OBGYN')
    expect(page).to have_content('U of Utah Medical School')
    expect(page).to have_content('U of Utah Medical School Hospital')

    expect(page).to_not have_content('Dr. Ellen Chang')
    expect(page).to_not have_content('Family Medicine')
    expect(page).to_not have_content('NYU School of Medicine')
    expect(page).to_not have_content('Intermountain Healthcare')
  end

  it "displays the name of the hospital a doctor works at and the names of their patients" do
    expect(page).to have_content('U of Utah Medical School Hospital')
    expect(page).to have_content('Pepe Hernandez')
    expect(page).to have_content('Preeti Singh')

    expect(page).to_not have_content('Intermountain Healthcare')
    expect(page).to_not have_content('Randy Jones')
  end
end
