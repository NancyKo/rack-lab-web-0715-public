require 'pry'
class ErbMaker
  def initialize(app)
    @app = app
  end

  def call(env)
    status, header, response = @app.call(env)
  		
  	if env["PATH_INFO"] == '/about'
  		template = "<h1><a href='/'>Are you lost?</a></h1>"
  		[status, header, [template] ]
   	else 
    	@response = env["REQUEST_METHOD"] + env["SERVER_PORT"]
    	template = File.read('lib/templates/index.html.erb')
    	erb = ERB.new(template).result(binding) 
    	[status, header, [erb] ]
    end
  end

end