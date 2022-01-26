class Course < ApplicationRecord

  # associations
  has_many :user_courses
  has_many :users, through: :user_courses

  enum expertise: { beginner: 0, intermediate: 1, expert: 2 }
  # validations
  validates_presence_of :title, :expertise, :created_by
end
