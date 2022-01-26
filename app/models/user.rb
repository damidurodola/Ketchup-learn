class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # associations
  has_many :user_courses
  has_many :courses, through: :user_courses

  enum expertise_level: { beginner: 0, intermediate: 1, expert: 2 }
  # validations
  validates_presence_of :first_name, :last_name, :role, :email, :password_digest
end
