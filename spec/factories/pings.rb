FactoryGirl.define do
  factory :ping do
    description { Faker::Lorem.sentences }
    association :wait
  end
end