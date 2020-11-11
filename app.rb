require 'sinatra/base'
require './lib/space'

class MakersBnB < Sinatra::Base

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

run! if app_file == $0
end
