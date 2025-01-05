class MaintenanceServiceController < ApplicationController

  def index
    begin
      maintenance_services = MaintenanceService.all

      maintenance_services.any? ? render(json: maintenance_services) : render_not_found("Maintenance Service not found")

    rescue Exception => e
      Rails.logger.debug("Error interno: #{e.message}")
      handle_internal_server_error(e)
    end
  end

  def show
    begin
      maintenance_services = MaintenanceService.where(car_id: Car.find_by(slug: params[:id]).id)

      maintenance_services.nil? ? render_not_found("Maintenance Service not found") : render(json: maintenance_services)

    rescue Exception => e
      Rails.logger.debug("Error interno: #{e.message}")
      handle_internal_server_error(e)
    end
  end

  def create
    begin
      result  = MaintenanceService.saveMaintenanceService(params)

      if result[:success] == false
        render_unprocessable_entity(result[:errors])
      else
        render json: result, status: :created
      end

    rescue Exception => e
      Rails.logger.debug("[] Error interno: #{e.message}")
      handle_internal_server_error(e)
    end
  end

  def update
    begin
      result = MaintenanceService.updateMaintenanceService(params)

      if result[:success] == false
        render_unprocessable_entity(result[:errors])
      else
        render json: result, status: :created
      end

    rescue Exception => e
      Rails.logger.debug("[] Error interno: #{e.message}")
      handle_internal_server_error(e)
    end
  end

  def destroy
    begin
      result = MaintenanceService.deleteMaintenanceService((params[:id]))

      if result[:success] == false
        render_unprocessable_entity("No se pudo eliminar el post." )
      else
        render json: result, status: :created
      end

    rescue Exception => e
      Rails.logger.debug("[] Error interno: #{e.message}")
      handle_internal_server_error(e)
    end
  end

end