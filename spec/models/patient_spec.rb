require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'relationships' do
    it {should have_many :doctors_patients}
    it {should have_many(:doctors), through: :doctors_patients}
  end
  describe 'methods' do
    it "lists patients in order" do
      @hospital1 = Hospital.create!(name: "St. Person Hospital")
      @hospital2 = Hospital.create!(name: "Other Hospital")
      @doctor1 = @hospital1.doctors.create!(name: "Dr. Lee", specialty: "Pediatrics", university: "Fancy Pants University")
      @doctor2 = @hospital1.doctors.create!(name: "Dr. Sally", specialty: "Bones", university: "Health University")
      @doctor3 = @hospital1.doctors.create!(name: "Dr. Susan", specialty: "Skin", university: "Health University")
      @patient1 = @doctor1.patients.create!(name: "Catherine", age: 12)
      @patient2 = @doctor1.patients.create!(name: "Ruby", age: 6)
      @patient3 = @doctor2.patients.create!(name: "Tina", age: 25)

      expect(Patient.youngest_to_oldest).to eq([@patient2, @patient1, @patient3])
    end
  end
end
