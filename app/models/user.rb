class User < ApplicationRecord
  enum expertise_level: { beginner: 0, intermediate: 1, expert: 2 }
  # validations
  validates_presence_of :first_name, :last_name, :role
end
