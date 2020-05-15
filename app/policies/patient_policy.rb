class PatientPolicy < ApplicationPolicy

  # def index?
  #   @current_user.admin?
  # end

  # def show?
  #   @current_user.admin? or @current_user == @user
  # end

  def new?
    !Patient.exists?(id: Patient.find_by_user_id(@current_user))
  end


end