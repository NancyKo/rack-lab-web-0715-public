require 'pry'
class RandomNumber
  def initialize(app)
    @app = app
  end

  def call(env)
    status, header, response = @app.call(env)
    response_body = response.first + ' - ' + rand(100).to_s
    [status, header, [response_body] ]
  end
end