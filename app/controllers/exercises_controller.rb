class ExercisesController < ApplicationController

  # GET: /exercises
  get "/exercises" do
    erb :"/exercises/index.html"
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
    binding.pry
    @exercise = Exercise.create(params[:exercise])
    @category = Category.find(params[:category_id])
    @exercise.category = @category
    @exercise.save
  end

  helpers do
    def valid_exercise_entries?

    end
  end
end
