class WorkoutsController < ApplicationController

####### GET /Workouts #######
  get "/workouts" do
    if logged_in?
      @featured_workout = Workout.featured
      @workouts = Workout.all
      erb :"/workouts/index"
    else
      redirect '/login'
    end
    
  end

  # GET: /workouts/new
  get "/workouts/new" do
    erb :"/workouts/new.html"
  end

  # POST: /workouts
  post "/workouts" do
    redirect "/workouts"
  end

  # GET: /workouts/5
  get "/workouts/:id" do
    erb :"/workouts/show.html"
  end

  # GET: /workouts/5/edit
  get "/workouts/:id/edit" do
    erb :"/workouts/edit.html"
  end

  # PATCH: /workouts/5
  patch "/workouts/:id" do
    redirect "/workouts/:id"
  end

  # DELETE: /workouts/5/delete
  delete "/workouts/:id/delete" do
    redirect "/workouts"
  end
end
