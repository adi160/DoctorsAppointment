class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user
  before_action :set_patient, only: [:edit, :update, :show, :destroy]
  
  def index
    @schedules = Schedule.all
    #authorize Patient
  end

  def patient_list
    @patients = Patient.all
  end

  def show
    authorize @patient
  end

  def new
    @patient = Patient.new
    authorize @patient
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.user = current_user
    @patient.save
    flash[:notice] = 'Create succesfully!'
    redirect_to doctors_path
  end

  def edit
    authorize @patient
  end

  def update
    authorize @patient
    if @patient.update(patient_params)
      flash[:notice] = 'Edit successfully!'
      redirect_to @patient
    else
      flash[:danger] = 'Something went wrong!'
      render 'edit'
    end
  end

  def destroy
    authorize @patient
    @patient.destroy
    flash[:danger] = 'Delete successfully!'
    redirect_to patients_path
  end

  private
  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :age, :sex, :address, :city, :state, :phone_no, :pincode)
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end

end