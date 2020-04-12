require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "84215ANDA7W00DC1RCL3"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    redirect '/login'
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    binding.pry
  end
end
