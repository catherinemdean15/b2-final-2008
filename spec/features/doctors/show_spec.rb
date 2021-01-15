require 'rails_helper'

RSpec.describe 'doctor show page' do
  before :each do
    @hospital = Hospital.create!(name: "St. Person Hospital")
    @doctor1 = @hospital.doctors.create!(name: "Dr. Lee", specialty: "Pediatrics", university: "Fancy Pants University")
    @doctor2 = @hospital.doctors.create!(name: "Dr. Sally", specialty: "Bones", university: "Health University")
    @patient1 = @doctor1.patients.create!(name: "Catherine", age: 12)
    @patient2 = @doctor1.patients.create!(name: "Ruby", age: 6)
    @patient3 = @doctor2.patients.create!(name: "Tina", age: 25)

    visit doctor_path(@doctor1)
  end

  it "shows the doctor's information" do
    expect(page).to have_content(@doctor1.name)
    expect(page).to have_content(@doctor1.specialty)
    expect(page).to have_content(@doctor1.university)

    expect(page).to_not have_content(@doctor2.name)
  end

  it "shows the name of the hospital and patients associated" do
    expect(page).to have_content(@hospital.name)
    expect(page).to have_content(@patient1.name)
    expect(page).to have_content(@patient2.name)

    expect(page).to_not have_content(@patient3.name)
  end

  it "has a button to remove patients" do
    expect(page).to have_content(@patient1.name)

    within ("#patient-#{@patient1.id}") do
      click_button "Remove patient"
    end

    expect(current_path).to eq(doctor_path(@doctor1))
    expect(page).to_not have_content(@patient1.name)
  end
end
