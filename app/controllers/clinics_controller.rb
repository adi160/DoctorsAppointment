class ClinicsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_doctor_id
  before_action :get_clinic_id, only: [:edit, :update, :show, :profile, :destroy]

  def index
    @clinics = @doctor.clinics
  end

  def show
  end

  def new
    @clinic = Clinic.new
  end

  def create
    @clinic = Clinic.new(clinic_params)
    @clinic.doctor_id = @doctor.id
    @clinic.save
    flash[:notice] = 'Create succesfully!'
    redirect_to doctor_path(@doctor)
  end

  def edit
  end

  def update
    if @clinic.update(clinic_params)
      flash[:notice] = 'Edit successfully!'
      redirect_to doctor_clinics_path
    else
      flash[:danger] = 'Something went wrong!'
      render 'edit'
    end
  end

  def destroy
    @clinic.destroy
    flash[:danger] = 'Delete successfully!'
    redirect_to doctor_path(@doctor)
  end

  def get_clinic_variable
    render json: {  clinics: Clinic.all }
  end

  private

  def clinic_params
    params.require(:clinic).permit(:clinic_address, :city, :state, :phone_no, :start, :end)
  end

  def get_clinic_id
    @clinic = Clinic.find(params[:id])
  end

  def get_doctor_id
    @doctor = Doctor.find(params[:doctor_id])
  end

end
