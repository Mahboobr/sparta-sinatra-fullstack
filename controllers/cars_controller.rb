class CarsController < Sinatra::Base

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  # Turn on Sinatra Reloader
  configure :development do
      register Sinatra::Reloader
  end

  get '/' do

      @manufacturer = "Manufacturer"

      @cars = Car.all

      erb :'cars/index'

  end

  get '/new'  do

    # create an empty post
    @cars = Car.new

    erb :'cars/new'

  end

  get '/:id' do

    # get the ID and turn it in to an integer
    id = params[:id].to_i

    # make a single post object available in the template
    # @post = $posts[id]
    @cars = Car.find id

    erb :'cars/show'

  end

  post '/' do

    car = Car.new

    # bind the values
    car.manufacturer = params[:manufacturer]
    car.model = params[:model]
    car.year = params[:year]
    car.engine_size = params[:engine_size]
    car.power = params[:power]

    # save the post
    car.save

    redirect "/"

  end

  put '/:id'  do

    # data is gathered in the params object
    id = params[:id].to_i

    # load the object with the id
    car = Car.find id

    # update the values
    car.manufacturer = params[:manufacturer]
    car.model = params[:model]
    car.year = params[:year]
    car.engine_size = params[:engine_size]
    car.power = params[:power]

    # save the post
    car.save

    # redirect the user to a GET route. We'll go back to the INDEX.
    redirect "/";

  end

  delete '/:id'  do

    # get the ID
    id = params[:id].to_i

    # delete the post from the database
    # $posts.delete_at(id)
    Car.destroy id

    # redirect back to the homepage
    redirect "/"

  end

  get '/:id/edit'  do

    # get the ID and turn it in to an integer
    id = params[:id].to_i

    # make a single post object available in the template
    # @post = $posts[id]
    @cars = Car.find id

    erb :'cars/edit'

  end

end
