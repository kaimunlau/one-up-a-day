FactoryBot.define do
  factory :update do
    title { Faker::Lorem.word }
    content { Faker::Lorem.paragraph }
    user { nil }
    date { Date.today }
  end
end
