class UserSerializer < ActiveModel::Serializer
  attributes :name, :email, :slug

  def read_attribute_for_serialization(attribute)
    return nil if attribute == :id
    super
  end

end
