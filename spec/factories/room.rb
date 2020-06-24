FactoryBot.define do
  factory :room do
    id {Faker::Number.non_zero_digit}
  end
end