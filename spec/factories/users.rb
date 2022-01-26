FactoryBot.define do
  factory :user do
    first_name { Faker::Name.name }
    last_name { Faker::Name.name }
    email 'dee@mail.com'
    expertise_level 0
    password 'damidee'
  end
end
