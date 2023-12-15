FactoryBot.define do
  factory :update_post do
    title { Faker::Lorem.word }
    content { Faker::Lorem.paragraph }
    association :user
    date { Date.today }
  end
end
