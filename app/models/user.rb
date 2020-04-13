class User < ActiveRecord::Base
  has_secure_password
  has_many :workouts

  def user_initials
    self.first_name.first + self.last_name.first
  end
end