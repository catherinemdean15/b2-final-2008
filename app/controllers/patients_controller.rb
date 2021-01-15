class PatientsController < ApplicationController
  def index
    @patients = Patient.youngest_to_oldest
  end

end
