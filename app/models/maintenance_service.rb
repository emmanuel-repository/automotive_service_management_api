class MaintenanceService < ApplicationRecord
  validate :date_in_the_past_or_present
  validates :description, presence: true

  belongs_to :car

  def self.saveMaintenanceService(data)

    maintenance_service = {
      description: data[:description],
      status: data[:status],
      date: data[:date],
      slug: SecureRandom.uuid,
      car_id: Car.find_by(slug: data[:slugCar]).id,
    }
    result = MaintenanceService.new(maintenance_service)

    if result.save
      return result
    else
      return { success: false, errors: result.errors.full_messages }
    end

  end

  def self.updateMaintenanceService(data)

    maintenance_service_params = {
      description: data[:description],
      status: data[:status],
      date: data[:date],
    }
    maintenance_service = MaintenanceService.find_by(slug: data[:id])

    if maintenance_service.update(maintenance_service_params)
      return maintenance_service
    else
      return { success: false, errors: maintenance_service.errors.full_messages }
    end

  end

  def self.deleteMaintenanceService(id)
    return  MaintenanceService.find_by(slug: id).destroy
  end

  private
  def date_in_the_past_or_present
    if date.present? && date > Date.today
      errors.add(:date, "debe ser una fecha pasada o presente")
    end
  end
end