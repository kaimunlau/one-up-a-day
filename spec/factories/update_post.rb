FactoryBot.define do
  factory :update_post do
    title { Faker::Lorem.word }
    content { Faker::Hacker.say_something_smart }
    association :user
    date { Date.today - 1 }
  end
end
