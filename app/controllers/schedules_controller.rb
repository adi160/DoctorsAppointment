class SchedulesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :current_user
  before_action :get_schedule, only: [:show, :edit, :update, :destroy]

  def index
    @schedules = Schedule.where(start: params[:start]..params[:end])
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @doctor = Doctor.find(params[:doctor_id])
    @schedule = Schedule.new(schedule_params)
    @schedule.patient_id = (Patient.find_by_user_id(current_user)).id
    @schedule.doctor_id = @doctor.id
    @schedule.save
  end

  def destroy
    @schedule.destroy
  end

  private
  def get_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.permit(:start, :end)
  end
end