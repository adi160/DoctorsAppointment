module ClinicsHelper

  def clinic_id
    clinic = Clinic.find_by_doctor_id(@doctor)
  end
  
end
