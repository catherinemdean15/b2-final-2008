require 'rails_helper'

RSpec.describe 'patients page' do
  before :each do
    @hospital1 = Hospital.create!(name: "St. Person Hospital")
    @hospital2 = Hospital.create!(name: "Other Hospital")
    @doctor1 = @hospital1.doctors.create!(name: "Dr. Lee", specialty: "Pediatrics", university: "Fancy Pants University")
    @doctor2 = @hospital1.doctors.create!(name: "Dr. Sally", specialty: "Bones", university: "Health University")
    @doctor3 = @hospital1.doctors.create!(name: "Dr. Susan", specialty: "Skin", university: "Health University")
    @patient1 = @doctor1.patients.create!(name: "Catherine", age: 12)
    @patient2 = @doctor1.patients.create!(name: "Ruby", age: 6)
    @patient3 = @doctor2.patients.create!(name: "Tina", age: 25)

    visit patients_path
  end

  it "lists patients oldest to youngest" do
    expect(@patient2.name).to appear_before(@patient1.name)
    expect(@patient1.name).to appear_before(@patient3.name)
  end

end
