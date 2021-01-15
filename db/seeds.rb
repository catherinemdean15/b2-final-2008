# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@hospital1 = Hospital.create!(name: "St. Person Hospital")
@hospital2 = Hospital.create!(name: "Other Hospital")
@doctor1 = @hospital1.doctors.create!(name: "Dr. Lee", specialty: "Pediatrics", university: "Fancy Pants University")
@doctor2 = @hospital1.doctors.create!(name: "Dr. Sally", specialty: "Bones", university: "Health University")
@doctor3 = @hospital1.doctors.create!(name: "Dr. Susan", specialty: "Skin", university: "Health University")
@patient1 = @doctor1.patients.create!(name: "Catherine", age: 12)
@patient2 = @doctor1.patients.create!(name: "Ruby", age: 6)
@patient3 = @doctor2.patients.create!(name: "Tina", age: 25)
