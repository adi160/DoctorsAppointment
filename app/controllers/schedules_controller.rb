class SchedulesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :current_user

  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.doctor_id = 2
    @schedule.save
  end

  def schedule_params
    params.permit(:start, :end)
  end
end