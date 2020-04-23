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
    if valid_workout_entries? && valid_minutes? && valid_exercises?
      
      @user = User.find(session[:user_id])
      @workout = Workout.new(params[:workout])
      params[:exercise_ids].each {|id| @workout.exercises << Exercise.find(id) } 
      @user.workouts << @workout
      @user.save

      redirect "/workouts/#{@workout.slug}"
    else
      redirect '/workouts/new'
    end
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

  ####### GET /workouts/:slug/edit & PATCH #######
  get "/workouts/:slug/edit" do
    if logged_in?
      @workout = Workout.find_by_slug(params[:slug])

      if @workout && user_owns_workout?(@workout)
        @exercises = Exercise.all
        erb :'workouts/edit'
      else
        redirect "/workouts/#{params[:slug]}"
      end
    else
      redirect '/login'
    end
  end

  patch "/workouts/:slug" do
    if valid_workout_entries? && valid_minutes?
      @workout = Workout.find_by_slug(params[:slug])
      @workout.update(params[:workout])
      
      @workout.exercises.clear
      params[:exercise_ids].each {|id| @workout.exercises << Exercise.find(id) }

      redirect "/workouts/#{@workout.slug}"
    else
      redirect "/workouts/#{params[:slug]}/edit"
    end
  end

  ####### DELETE /workouts/:slug #######
  delete "/workouts/:slug" do
    @workout = Workout.find_by_slug(params[:slug])
    @workout.delete

    redirect '/workouts'
  end

  ####### Workout Controller Helper Methods #######
  helpers do 
    def valid_workout_entries?
      params[:workout].values.all? {|v| !v.empty?}
    end

    def valid_minutes?
      min = params[:workout][:minutes].to_i
      min > 0
    end

    def valid_exercises?
      params[:exercise_ids] && params[:exercise_ids].count == 5
    end

    def user_owns_workout?(workout)
      workout.user_id == session[:user_id]
    end
  end
end
