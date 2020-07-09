FactoryBot.define do
  factory :post do
    content {"hello!"}
    image {"sample-image.jpg"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end
end
