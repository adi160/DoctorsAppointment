class PatientsController < ApplicationController
  before_action :current_user
  before_action :set_patient, only: [:edit, :update, :show, :destroy]
  
  def index
    #@patients = Patient.all
    @schedules = Schedule.all
    #authorize Patient
  end

  def show
  end

  def new
    @patient = Patient.new
    #authorize @patient
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.user = current_user
    @patient.save
    redirect_to doctors_path
  end

  def edit
  end

  def update
    if @patient.update(patient_params)
      redirect_to @patient
    else
      render 'edit'
    end
  end

  def destroy
    @patient.destroy

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