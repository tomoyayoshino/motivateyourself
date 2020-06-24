require 'rails_helper'
describe User do
  describe '#create' do
    it "nameにバリデーションが適用されていること" do
      user = User.new(name: "", email: "kkk@gmail.com", image:"image",password: "00000000", password_confirmation: "00000000")
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
    end
    it "emailにバリデーションが適用されていること" do
      user = User.new(name: "aaa", email: "", image:"image",password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    it "emailにバリデーションが適用されていること" do
      user = User.new(name: "aaa", email: "", image:"image",password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    it "imageにバリデーションが適用されていること" do
      user = User.new(name: "aaa", email: "kkk@gmail.com", image:"",password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors[:image]).to include("を入力してください")
    end
  end
end
