class CarsController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')

  set :views, Proc.new { File.join(root, "views") }

  configure :development do
      register Sinatra::Reloader
  end

  get '/' do

      @manufacturer = "Manufacturer"

      @cars = Car.all

      erb :'cars/index'

  end

  get '/new'  do

    @cars = Car.new

    erb :'cars/new'

  end

  get '/:id' do

    id = params[:id].to_i

    @cars = Car.find id

    erb :'cars/show'

  end

  post '/' do

    car = Car.new

    car.manufacturer = params[:manufacturer]
    car.model = params[:model]
    car.year = params[:year]
    car.engine_size = params[:engine_size]
    car.power = params[:power]

    car.save

    redirect "/"

  end

  put '/:id'  do

    id = params[:id].to_i

    car = Car.find id

    car.manufacturer = params[:manufacturer]
    car.model = params[:model]
    car.year = params[:year]
    car.engine_size = params[:engine_size]
    car.power = params[:power]

    car.save

    redirect "/";

  end

  delete '/:id'  do
    id = params[:id].to_i
    Car.destroy id
    redirect "/"

  end

  get '/:id/edit'  do

    id = params[:id].to_i

    @cars = Car.find id

    erb :'cars/edit'

  end

end
