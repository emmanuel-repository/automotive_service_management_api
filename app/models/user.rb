class User < ApplicationRecord

  require 'securerandom'
  has_secure_password

  validates :email, uniqueness: { message: "Correo ya está registrado. Por favor, utiliza otro." }

  def self.saveUser(data)

    user = {
      email: data[:email],
      name: data[:name],
      password: data[:password],
      slug: SecureRandom.uuid,
      status: data[:status],
    }
    result = User.new(user)

    if result.save
      return result
    else
      return { success: false, errors: result.errors.full_messages }
    end

  end


end