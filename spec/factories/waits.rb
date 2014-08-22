FactoryGirl.define do
  factory :wait do
    description { Faker::Lorem.sentences }
    association :user
  end
end