module CategoryHelper
  def category_id
    category = Category.find(@doctor.category_id)
  end
end
