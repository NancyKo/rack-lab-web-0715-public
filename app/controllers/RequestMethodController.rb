require 'pry'
class RequestMethod

  def initialize(app)
    @app = app
  end

  def call(env)
    status, header, response = @app.call(env)
    body = response.first + env["REQUEST_METHOD"]
    [status, header, [body] ]
  end
end