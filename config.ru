require 'pry'
require 'rack'
require 'erb'

use ErbMaker
use RequestMethod
use ServerPort
run Application.new