require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

get '/' do
  erb :login
end

get "/restaurants" do
  @restaurants = Restaurant.all

  erb :index
end

get '/restaurants/new' do
  erb :new
end

get '/restaurants/:id' do
  @restaurant = Restaurant.find(params[:id])
  erb :show
end

post '/restaurants' do
  name = params[:name]
  city = params[:city]
  restaurant = Restaurant.new(name: name, city: city)
  restaurant.save

  redirect "/restaurants/#{restaurant.id}"
end

post '/sign_in' do
  username = params[:username]
  password = params[:password]

  @user = User.find_by(username: username)

  if @user && @user.password == password
    redirect '/restaurants'
  else
    redirect '/'
  end
end
