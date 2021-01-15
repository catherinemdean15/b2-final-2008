class DoctorsPatient < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  enum status: [:inactive, :active]
end
