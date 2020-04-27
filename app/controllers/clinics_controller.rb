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
    @clinic.doctor_id = @doctor.id
    @clinic.save
    redirect_to doctors_path
  end

  def get_clinic_variable
    render json: {  clinics: Clinic.all }
  end

  private

  def clinic_params
    params.require(:clinic).permit(:clinic_address, :city, :state, :phone_no, :start, :end)
  end

end
