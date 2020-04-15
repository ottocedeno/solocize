class UsersController < ApplicationController

  ####### GET /users/ #######
  get "/users" do
    if logged_in?
      @users = User.all
      erb :"/users/index"
    else
      redirect '/login'
    end
  end

  ####### GET /users/:slug #######
  get "/users/:username" do
    if logged_in?
      @user = User.find_by(username: params[:username])
      erb :"/users/show"
    else
      redirect '/login'
    end
  end
end
