class Course < ApplicationRecord
  enum expertise: { beginner: 0, intermediate: 1, expert: 2 }
  # validations
  validates_presence_of :title, :expertise, :created_by
end
