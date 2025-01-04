class MaintenanceServiceSerializer < ActiveModel::Serializer
  attributes :description, :status, :date, :slug

  def read_attribute_for_serialization(attribute)
    return nil if attribute == :id
    super
  end

end
