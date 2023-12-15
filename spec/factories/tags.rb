FactoryBot.define do
  factory :tag do
    title { Faker::Commerce.unique.material }
  end
end
