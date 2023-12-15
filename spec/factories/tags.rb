FactoryBot.define do
  factory :tag do
    title { Faker::Commerce.material }
  end
end
