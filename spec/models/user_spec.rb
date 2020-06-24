require 'rails_helper'
describe User do
  describe '#create' do
    it "nameにバリデーションが適用されていること" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end
    it "emailにバリデーションが適用されていること" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    it "imageにバリデーションが適用されていること" do
      user = build(:user, image: "")
      user.valid?
      expect(user.errors[:image]).to include("を入力してください")
    end
  end
end
