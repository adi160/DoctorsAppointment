class DoctorsController < ApplicationController
  before_action :current_user
  before_action :get_id, only: [:edit, :update, :show, :profile, :destroy]

  def index
    @doctors = Doctor.search(params[:search])
  end

  def show
    @clinics = @doctor.clinics
  end

  def profile
  end
  
  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    @doctor.user = current_user
    @doctor.save
    flash[:notice] = 'Saved succesfully!'
    redirect_to @doctor
  end

  def edit
  end

  def update
    if @doctor.update(doctor_params)
      flash[:notice] = 'Edit successfully!'
      redirect_to @doctor
    else
      flash[:danger] = 'Something went wrong!'
      render 'edit'
    end
  end

  def destroy
    @doctor.destroy
    flash[:danger] = 'Delete successfully!'
    redirect_to root_path
  end

  private
  
  def get_id
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name, :dob, :address, :city, :state, :country, :pincode, :category_id)
  end
end
