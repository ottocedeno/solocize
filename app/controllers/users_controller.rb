class UsersController < ApplicationController

  ####### GET /users/ #######
  get "/users" do
    @users = User.all
    erb :"/users/index"
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

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
