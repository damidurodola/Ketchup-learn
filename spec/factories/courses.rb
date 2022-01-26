FactoryBot.define do
  factory :course do
    title { Faker::Lorem.word }
    expertise 0
    created_by { Faker::Number.number(10) }
  end
end