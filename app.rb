require 'sinatra/base'
require './lib/spaces'
require_relative 'lib/user'
require 'sinatra/flash'
require_relative 'lib/database_connection_setup'
class MakersBnB < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do 
    erb :index
  end 

  post '/options' do 
    if User.log_in(username: params[:username], password: params[:password])
      redirect '/options'
    else 
      flash[:notice] = 'Incorrect username or password!'
      redirect '/'
    end
  end 

  post '/options/new_user' do 
    if User.sign_up(username: params[:new_username], password: params[:new_password])
      redirect '/options'
    else 
      flash[:notice] = 'Username taken!'
      redirect '/'
    end
  end 

  get '/options' do 
    @user = User.find_user(id: User.current_user)
    erb :options
  end 
  get '/spaces' do
    @spaces = Space.all
    erb :all_spaces
  end

  get '/create_space' do
    erb :create_space
  end

  post '/spaces' do
    Space.create_space(name: params[:name],description: params[:description],price: params[:price],date: params[:date],availability: params[:availability])
    redirect '/spaces'
  end


end 
