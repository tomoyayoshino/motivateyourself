FactoryBot.define do
  factory :notification do
    visiter_id { Faker::Number.non_zero_digit }
    visited_id { Faker::Number.non_zero_digit }
    action { true }
    checked { 0 }
    post
    comment
    room
    message
  end
end
