require './environment'

module FormsLab
  class App < Sinatra::Base

    get '/' do
      erb :root
    end

    get '/new' do
      erb :'pirates/new'
    end

    post '/pirates' do
      # {"pirate"=>{"name"=>"asdf", "weight"=>"fw", "height"=>"ew", "ships"=>
      # {"one"=>{"name"=>"rqe", "type"=>"eqw", "booty"=>"gbdf"},
      # "two"=>{"name"=>"ht", "type"=>"hg", "booty"=>"wetr"}}}}
      @params = params
      puts params
      binding.pry
      pirate = Pirate.new

      pirate.name = params[:pirates][:name]
      pirate.weight = params[:pirates][:weight]
      pirate.height = params[:pirates][:height]
      @pirate = pirate

      ship1 = Ship.new
      ship1.name = params[:pirates][:ships].first[:name]
      ship1.type = params[:pirates][:ships].first[:type]
      ship1.booty = params[:pirates][:ships].first[:booty]
      @ship1 = ship1

      ship2 = Ship.new
      ship2.name = params[:pirates][:ships].last[:name]
      ship2.type = params[:pirates][:ships].last[:type]
      ship2.booty = params[:pirates][:ships].last[:booty]
      @ship2 = ship2

      erb :'pirates/show'
    end
  end
end
