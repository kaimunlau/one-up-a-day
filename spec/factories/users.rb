FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
    first_name { Faker::Name.first_name }
  end
end
