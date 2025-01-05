class Car < ApplicationRecord

  has_many :maintenance_services, dependent: :delete_all

  validates :plate_number, uniqueness: { message: "El número de placa ya está registrado. Por favor, utiliza otro." }
  validates :year, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1900,
    less_than_or_equal_to: ->(_record) { Time.current.year },
    message: "debe ser un número entre 1900 y el año actual"
  }

  def self.saveCard(data)

    car = {
      plate_number: data[:plateNumber],
      model: data[:model],
      year: data[:year],
      slug: SecureRandom.uuid
    }
    result = Car.new(car)

    if result.save
      return result
    else
      return { success: false, errors: result.errors.full_messages }
    end

  end

  def self.updateCar(data)

    carParams = {
      plate_number: data[:plate_number],
      model: data[:model],
      year: data[:year]
    }
    car = Car.find_by(slug: data[:id])

    if car.update(carParams)
      return car
    else
      return { success: false, errors: car.errors.full_messages }
    end

  end

  def self.deleteCar(id)
    return  Car.find_by(slug: id).destroy
  end

end