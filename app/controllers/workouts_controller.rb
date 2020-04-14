class WorkoutsController < ApplicationController

####### GET /workouts #######
  get "/workouts" do
    if logged_in?
      @featured_workout = Workout.featured
      @workouts = Workout.all
      erb :"/workouts/index"
    else
      redirect '/login'
    end
    
  end

  ####### GET /workouts/new && POST /workouts #######
  get "/workouts/new" do
    if logged_in?
      @exercises = Exercise.all
      erb :"/workouts/new"
    else
      redirect '/login'
    end    
  end

  post "/workouts" do
    binding.pry
  end

  ####### GET /workouts/:slug #######
  get "/workouts/:slug" do
    if logged_in?
      @workout = Workout.find_by_slug(params[:slug])

      if @workout
        erb :"/workouts/show"
      else
        redirect '/workouts'
      end
    else
      redirect '/login'
    end    
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
