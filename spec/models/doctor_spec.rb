require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'relationships' do
    it {should belong_to :hospital}
    it {should have_many :doctors_patients}
    it {should have_many(:patients), through: :doctors_patients}
  end
  describe 'instance methods' do
    it "active_patients" do
      @hospital = Hospital.create!(name: "St. Person Hospital")
      @doctor1 = @hospital.doctors.create!(name: "Dr. Lee", specialty: "Pediatrics", university: "Fancy Pants University")
      @patient1 = @doctor1.patients.create!(name: "Catherine", age: 12)
      @patient2 = @doctor1.patients.create!(name: "Ruby", age: 6)
      @patient3 = Patient.create!(name: "Tina", age: 25)
      DoctorsPatient.create!(doctor_id: @doctor1.id, patient_id: @patient3.id, status: 0)

      expect(@doctor1.active_patients).to eq([@patient1, @patient2])
    end
  end
end
