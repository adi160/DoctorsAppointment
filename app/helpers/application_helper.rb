module ApplicationHelper

  def find_user
    present_user = Doctor.find_by_user_id(current_user) || Patient.find_by_user_id(current_user)
  end
  
end
