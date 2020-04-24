class DoctorsController < ApplicationController
  before_action :current_user
  #before_action :get_id 

  def index
    @doctors = Doctor.search(params[:search])
  end

  def show
    @doctor = Doctor.find(params[:id])
    @clinics = @doctor.clinics
  end
  
  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    @doctor.user = current_user
    @doctor.save
    redirect_to doctors_path
  end

  private
  
  def get_id
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:first_name, :middle_name, :last_name, :dob, :address, :city, :state, :country, :pincode, :category_id)
  end
end
