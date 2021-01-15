require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'relationships' do
    it {should have_many :doctors}
  end
  describe 'instance methods' do
    before :each do
      @hospital1 = Hospital.create!(name: "St. Person Hospital")
      @hospital2 = Hospital.create!(name: "Other Hospital")
      @doctor1 = @hospital1.doctors.create!(name: "Dr. Lee", specialty: "Pediatrics", university: "Fancy Pants University")
      @doctor2 = @hospital1.doctors.create!(name: "Dr. Sally", specialty: "Bones", university: "Health University")
      @doctor3 = @hospital1.doctors.create!(name: "Dr. Susan", specialty: "Skin", university: "Health University")
      @doctor4 = @hospital2.doctors.create!(name: "Dr. Samantha", specialty: "Blood", university: "Different University")
      @patient1 = @doctor1.patients.create!(name: "Catherine", age: 12)
      @patient2 = @doctor1.patients.create!(name: "Ruby", age: 6)
      @patient3 = @doctor2.patients.create!(name: "Tina", age: 25)
    end

    it "unique_universities" do
      expect(@hospital1.unique_universities).to eq(["Fancy Pants University", "Health University"])
    end

    it "number_of_doctors" do
      expect(@hospital1.number_of_doctors).to eq(3)
    end
  end
end
