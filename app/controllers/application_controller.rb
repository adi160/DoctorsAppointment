class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  def after_sign_in_path_for(resource_or_scope)
    role = current_user.role
    doctor =  Doctor.find_by_user_id(current_user)
    patient = Patient.find_by_user_id(current_user)
    if role === "doctor"
      doctor_path(doctor)
    elsif role === "patient"
      patients_path
    else
      users_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

end
