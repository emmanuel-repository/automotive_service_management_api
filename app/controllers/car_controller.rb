class CarController < ApplicationController

  def index
    begin
      cars = Car.all

      cars.any? ? render(json: cars) : render_not_found("Car not found")

    rescue Exception => e
      Rails.logger.debug("Error interno: #{e.message}")
      handle_internal_server_error(e)
    end
  end

  def show
  end

  def create
    begin
      result  = Car.saveCard(params)

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
      result = Car.updateCar(params)

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
      result = Car.deleteCar(params[:id])

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