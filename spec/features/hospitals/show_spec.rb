require 'rails_helper'

RSpec.describe 'hospital show page' do
  before :each do
    @hospital1 = Hospital.create!(name: "St. Person Hospital")
    @hospital2 = Hospital.create!(name: "Other Hospital")
    @doctor1 = @hospital1.doctors.create!(name: "Dr. Lee", specialty: "Pediatrics", university: "Fancy Pants University")
    @doctor2 = @hospital1.doctors.create!(name: "Dr. Sally", specialty: "Bones", university: "Health University")
    @doctor3 = @hospital1.doctors.create!(name: "Dr. Susan", specialty: "Skin", university: "Health University")
    @patient1 = @doctor1.patients.create!(name: "Catherine", age: 12)
    @patient2 = @doctor1.patients.create!(name: "Ruby", age: 6)
    @patient3 = @doctor2.patients.create!(name: "Tina", age: 25)

    visit hospital_path(@hospital1)
  end

  it "shows the hospital name" do
    expect(page).to have_content(@hospital1.name)
    expect(page).to_not have_content(@hospital2.name)
  end

  it "shows the number of doctors that work at the hospital" do
    expect(page).to have_content(@hospital1.number_of_doctors)
  end

  it "shows a unique list of universities doctors attended" do
    expect(page).to have_content(@hospital1.unique_universities[0])
    expect(page).to have_content(@hospital1.unique_universities[1])
  end


end
