class User < ActiveRecord::Base
  include Slugify::InstanceMethods
  extend Slugify::ClassMethods
  
  has_secure_password
  has_many :workouts

  def initials
    self.first_name.first + self.last_name.first
  end

  def first_two_workouts
    self.workouts.reverse.first(2)
  end
end