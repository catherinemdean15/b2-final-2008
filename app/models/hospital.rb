class Hospital < ApplicationRecord
  has_many :doctors

  def unique_universities
    doctors.pluck(:university).uniq
  end

  def number_of_doctors
    doctors.count
  end
end
