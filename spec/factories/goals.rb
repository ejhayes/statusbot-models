FactoryGirl.define do
  factory :goal do
    description { Faker::Lorem.sentences }
    association :user
  end
end