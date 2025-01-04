class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.

  before_action :authorize_request
  allow_browser versions: :modern

  def handle_internal_server_error(exception)
    render json: { error: "Internal Server Error", message: exception.message }, status: :internal_server_error
  end

  def render_not_found(message = "Record not found")
    render json: { error: message }, status: :bad_request
  end

  def render_unprocessable_entity(errors)
    render json: { errors: errors }, status: :unprocessable_entity
  end

  private

  def authorize_request
    begin
      token = request.headers['Authorization'].split(' ').last
      decoded = JsonWebToken.decode(token)

      if decoded.nil?
        render json: { error: 'Unauthorized' }, status: :unauthorized
      else
        # Encuentra el usuario según el ID del payload
        @current_user = User.find_by(slug: decoded[:slug])
      end
    rescue Exception => e
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

end
