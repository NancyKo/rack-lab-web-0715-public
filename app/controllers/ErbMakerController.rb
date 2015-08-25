require 'pry'
class ErbMaker
  def initialize(app)
    @app = app
  end

  def call(env)
    status, header, response = @app.call(env)
    template = File.read('lib/templates/index.html.erb') 
    ERB.new(template).result(binding)
  end

end