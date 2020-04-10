class WorkoutExercisesController < ApplicationController

  # GET: /workout_exercises
  get "/workout_exercises" do
    erb :"/workout_exercises/index.html"
  end

  # GET: /workout_exercises/new
  get "/workout_exercises/new" do
    erb :"/workout_exercises/new.html"
  end

  # POST: /workout_exercises
  post "/workout_exercises" do
    redirect "/workout_exercises"
  end

  # GET: /workout_exercises/5
  get "/workout_exercises/:id" do
    erb :"/workout_exercises/show.html"
  end

  # GET: /workout_exercises/5/edit
  get "/workout_exercises/:id/edit" do
    erb :"/workout_exercises/edit.html"
  end

  # PATCH: /workout_exercises/5
  patch "/workout_exercises/:id" do
    redirect "/workout_exercises/:id"
  end

  # DELETE: /workout_exercises/5/delete
  delete "/workout_exercises/:id/delete" do
    redirect "/workout_exercises"
  end
end
