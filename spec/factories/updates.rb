FactoryGirl.define do
  factory :update do
    description { Faker::Lorem.sentences }
    association :user
    start_time { DateTime.now - 1 }
    stop_time { DateTime.now + 1 }
  end
end