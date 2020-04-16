class ExercisesController < ApplicationController

  # GET: /exercises
  get "/exercises" do
    if logged_in?
      @categories = Category.all
      erb :"/exercises/index"
    else
      redirect '/login'
    end
  end

  ####### GET /exercises/new && POST /exercises #######
  get "/exercises/new" do
    if logged_in?
      @categories = Category.all
      erb :'exercises/new'
    else
      redirect '/login'
    end
  end

  post "/exercises" do
    if valid_exercise_entries? && valid_reps? && selected_category?
      @exercise = Exercise.create(params[:exercise])
      @category = Category.find(params[:category_id])
      @exercise.category = @category
      @exercise.save

      redirect '/exercises'
    else
      redirect '/exercises/new'
    end
    
  end

  helpers do
    def valid_exercise_entries?
      params[:exercise].values.all? {|v| !v.empty?}
    end

    def valid_reps?
      reps = params[:exercise][:rep_count].to_i
      reps > 0
    end

    def selected_category?
      !!params[:category_id]
    end
  end
end
