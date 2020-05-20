class DoctorsController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user
  before_action :get_id, only: [:edit, :update, :show, :profile, :destroy]

  def index
    @doctors = Doctor.search(params[:search])
  end

  def show
    authorize @doctor
    #@clinics = @doctor.clinics
    @today_schedules = Schedule.where("DATE(start) = DATE(?)", Date.today)
    @future_schedules = Schedule.where("DATE(start) > DATE(?)", Date.today)
    @past_schedules = Schedule.where("DATE(start) < DATE(?)", Date.today)
  end

  def profile
    authorize @doctor
  end
  
  def new
    @doctor = Doctor.new
    authorize @doctor
  end

  def create
    @doctor = Doctor.new(doctor_params)
    @doctor.user = current_user
    @doctor.save
    authorize @doctor
    flash[:notice] = 'Create succesfully!'
    redirect_to @doctor
  end

  def edit
    authorize @doctor
  end

  def update
    authorize @doctor
    if @doctor.update(doctor_params)
      flash[:notice] = 'Edit successfully!'
      redirect_to @doctor
    else
      flash[:danger] = 'Something went wrong!'
      render 'edit'
    end
  end

  def destroy
    authorize @doctor
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
