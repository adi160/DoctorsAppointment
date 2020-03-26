class DoctorsController < ApplicationController
  before_action :current_user

  def index
    @doctors = Doctor.all
  end

  def show
    @doctor = Doctor.find(params[:id])
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
  def doctor_params
    params.require(:doctor).permit(:first_name, :middle_name, :last_name, :dob, :address, :city, :state, :country, :pincode, :category_id)
  end
end
