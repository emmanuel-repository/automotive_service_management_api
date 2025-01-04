class ErrorsController < ApplicationController

  def internal_server_error
    render json: { error: "Something went wrong" }, status: :internal_server_error
  end

end