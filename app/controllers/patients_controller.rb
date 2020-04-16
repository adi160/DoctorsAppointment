class PatientsController < ApplicationController
  before_action :current_user
  
  def index
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.user = current_user
    @patient.save
    redirect_to doctors_path
  end


  private
  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :age, :sex, :address, :city, :state, :phone_no, :pincode)
  end
end