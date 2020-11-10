require 'sinatra/base'
require './lib/space'

class MakersBnB < Sinatra::Base

    get '/spaces' do
        @spaces = Space.all
        erb :all_spaces        
    end

run! if app_file == $0
end