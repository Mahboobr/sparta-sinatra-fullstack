class DescriptionsController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')

  set :views, Proc.new { File.join(root, "views") }

  configure :development do
      register Sinatra::Reloader
  end

  get '/description' do

      @model = "Model"

      @description = Description.all

      erb :'descriptions/index'

  end

  get '/description/new'  do

    @decription = Description.new

    erb :'description/new'

  end

  get '/description/:id' do

    id = params[:id].to_i

    @description = Description.find id

    erb :'description/show'

  end

  post '/description' do

    description = Description.new

    description.model = params[:model]
    description.description = params[:description]

    description.save

    redirect "/"

  end

  put '/description/:id'  do

    id = params[:id].to_i

    description = Description.find id

    description.model = params[:model]
    description.description = params[:description]

    description.save

    redirect "/";

  end

  delete '/description/:id'  do

    id = params[:id].to_i

    Description.destroy id

    redirect "/"

  end

  get '/description/:id/edit'  do

    id = params[:id].to_i

    @description = Description.find id

    erb :'description/edit'

  end

end
