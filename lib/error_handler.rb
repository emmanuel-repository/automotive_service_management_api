class ErrorHandler

  def initialize(app)
    @app = app
  end

  def call(env)
    @app.call(env)
  rescue StandardError => e
    [500, { 'Content-Type' => 'application/json' }, [{ error: 'Internal Server Error', message: e.message }.to_json]]
  end

end