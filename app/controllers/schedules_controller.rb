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
    @schedule = Schedule.new(schedule_params)
    @schedule.doctor_id = 2
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