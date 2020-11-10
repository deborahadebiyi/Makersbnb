require 'sinatra/base'
require_relative 'lib/user'
class MakersBnB < Sinatra::Base
  enable :sessions, :method_override

  get '/' do 
    erb :index
  end 

  post '/options' do 
    if User.log_in(username: params[:username], password: params[:password])
      redirect '/options'
    else 
      redirect '/'
    end
  end 

  post '/options/new_user' do 
    if User.sign_up(username: params[:new_username], password: params[:new_password])
      redirect '/options'
    else 
      redirect '/'
    end
  end 

  get '/options' do 
    @user = User.find_user(id: User.current_user)
    erb :options
  end 

end 
