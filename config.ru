require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require_relative './models/car.rb'
require_relative './controllers/cars_controller.rb'
require_relative './controllers/description_controller.rb'

use Rack::Reloader

use Rack::MethodOverride

# run CarsController
run DescriptionsController
