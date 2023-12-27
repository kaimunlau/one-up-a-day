FactoryBot.define do
  factory :tag do
    title { Faker::Commerce.unique.department(max: 1, fixed_amount: true) }
  end
end
