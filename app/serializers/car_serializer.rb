class CarSerializer < ActiveModel::Serializer
  attributes :plate_number, :year, :model, :slug

  has_many :maintenance_services

  def read_attribute_for_serialization(attribute)
    return nil if attribute == :id
    super
  end

end
