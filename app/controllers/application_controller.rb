require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "84215ANDA7W00DC1RCL3"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  ####### Index Redirect #######
  get "/" do
    redirect '/login'
  end

  ####### Login Flow #######
  get '/login' do
    if logged_in?
      redirect '/workouts'
    else
      erb :login
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      set_session(@user)
      redirect '/workouts'
    else
      redirect '/login'
    end
  end

  ####### Helper Methods #######
  helpers do
    def set_session(user)
      session[:user_id] = user.id 
    end

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end
end
