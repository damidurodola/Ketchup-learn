class CourseSerializer < ActiveModel::Serializer
  attributes :id, :title, :expertise, :created_by, :updated_at
end
