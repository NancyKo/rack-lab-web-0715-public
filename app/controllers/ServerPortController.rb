require 'pry'
class ServerPort

  def initialize(app)
    @app = app
  end

  def call(env)
    status, header, response = @app.call(env)
    body = response.first + " " + env["SERVER_PORT"]
    [status, header, [body] ]
  end
end