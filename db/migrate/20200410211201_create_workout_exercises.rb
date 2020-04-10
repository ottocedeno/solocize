class CreateWorkoutExercises < ActiveRecord::Migration
  def change
    create_table :workout_exercises do |t|
      t.integer :workout_id
      t.integer :exercise_id
      t.timestamps null: false
    end
  end
end
