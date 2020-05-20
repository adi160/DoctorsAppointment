class DoctorPolicy < ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @doctor = model
  end

  def show?
    @current_user.admin? or @current_user.patient? or @current_user.id == @doctor.user_id 
  end

  def profile?
    @current_user.admin? or @current_user.id == @doctor.user_id
  end

  def new?
    !Doctor.exists?(user_id: @current_user.id)
  end

  def edit?
    update?
  end

  def update?
    @current_user.id == @doctor.user_id
  end

  def destroy?
    @current_user.admin? or @current_user.id == @doctor.user_id
  end

end