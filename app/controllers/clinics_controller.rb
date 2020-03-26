class ClinicsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @clinic = Clinic.new
  end

  def create
    @doctor = Doctor.find(params[:doctor_id])
    @clinic = Clinic.new(clinic_params)
    @clinic.doctor_id = @doctor
    @clinic.save
    redirect_to doctors_path
  end

  private

  def clinic_params
    params.require(:clinic).permit(:clinic_address, :city, :phone_no, :start, :end)
  end

end
