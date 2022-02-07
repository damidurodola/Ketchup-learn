class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :expertise_level, :role, :first_name, :last_name

  has_many :courses
end
