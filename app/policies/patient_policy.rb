class PatientPolicy 
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @patient = model
  end

  def index?
    @current_user.admin? or @current_user.id == @patient.user_id
  end

  def show?
    @current_user.admin? or @current_user.id == @patient.user_id
  end

  def new?
    !Patient.exists?(user_id: @current_user.id)
  end

  def edit?
    update?
  end

  def update?
    @current_user.id == @patient.user_id
  end

  def destroy?
    @current_user.admin? or @current_user.id == @patient.user_id
  end

end