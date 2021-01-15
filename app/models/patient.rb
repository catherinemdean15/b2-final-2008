class Patient < ApplicationRecord
  has_many :doctors_patients
  has_many :doctors, through: :doctors_patients

  def self.youngest_to_oldest
    order(:age)
  end
end
