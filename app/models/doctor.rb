class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :doctors_patients
  has_many :patients, through: :doctors_patients

  def active_patients
    patients.joins(:doctors_patients).where("doctors_patients.status = 1")
  end
end
