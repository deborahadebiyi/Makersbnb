require 'sinatra/base'
require './lib/spaces'
require 'sinatra/flash'
require_relative 'lib/user'
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
      # flash[:notice] = 'Incorrect username or password!'
      redirect '/'
    end
  end

  post '/options/new_user' do
    if User.sign_up(username: params[:new_username], password: params[:new_password])
      redirect '/options'
    else
      # flash[:notice] = 'Username taken!'
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

  get '/list-space' do
    erb :list_space
  end

  post '/book/:space_id' do
    Space.book(space_id: params[:space_id], user_id: User.current_user)
    redirect '/options'
  end

  post '/syncing' do
    Space.create_space(name: params[:name], description: params[:description], price: params[:price], startdate: params[:startdate], enddate: params[:enddate],availability: true, user_id: User.current_user)
    redirect '/spaces'
  end

  get '/bookings' do
    @spaces = Booking.get_space_details(user_id: User.current_user)
    erb :bookings
  end

  get '/approve' do
    @pending = User.show_approvals(id: User.current_user)
    erb :approvals
  end

  post '/approved/:booking_id' do
    Booking.approve(booking_id: params[:booking_id])
    redirect '/options'
  end
end
