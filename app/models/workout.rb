class Workout < ActiveRecord::Base
  
  include Slugify::InstanceMethods
  extend Slugify::ClassMethods
  
  belongs_to :user
  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises

  def self.featured
    self.all.sample
  end
end
