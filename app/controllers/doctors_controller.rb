class DoctorsController < ApplicationController
  before_action :find_doctor
  def show

  end

  def update
    relationship = DoctorsPatient.where(doctor_id: params[:id], patient_id: patient_id[:patient]).first
    relationship.update_attributes(:status => 'inactive')
    redirect_to doctor_path(@doctor)
  end


  private
  def find_doctor
    @doctor = Doctor.find(params[:id])
  end

  def patient_id
    params.require(:doctor).permit(:patient)
  end
end
