FactoryBot.define do

  factory :user do
    name                  {"abc"}
    email                 {"kkk@gmail.com"}
    image                 {Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/sample-image.jpg"))}
    password              {"00000000"}
    password_confirmation {"00000000"}
  end

end