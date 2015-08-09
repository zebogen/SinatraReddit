helpers do

  def resource_name(resource_object)
    resource_object.class.table_name
  end

  def time_since_creation(object)
    ((Time.now - object.created_at) / (60 * 60)).floor
  end

end
