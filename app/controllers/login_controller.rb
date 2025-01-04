class LoginController < ApplicationController

  skip_before_action :authorize_request, only: [:auth, :create]

  def auth
    begin

      @user = User.find_by_email(params[:email])

      if @user&.authenticate(params[:password])

        token = JsonWebToken.encode(slug: @user[:slug])

        result = {
          name: @user[:name],
          email: @user[:email],
          slug: @user[:slug],
          token: token,
        }

        render json: result, status: :created

      else
        raise "Usuario o contraseña no son correctos."
      end

    rescue Exception => e
      Rails.logger.debug("Error interno: #{e.message}")
      handle_internal_server_error(e)
    end
  end

  def create
    begin
      result  = User.saveUser(params)

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


end