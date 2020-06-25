require 'rails_helper'
describe User do
  describe '#create' do
    it "name,email,image,password,password_confirmationがあれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end
    it "nameが空では登録できないこと" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end
    it "emailが空では登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    it "imageが空では登録できないこと" do
      user = build(:user, image: "")
      user.valid?
      expect(user.errors[:image]).to include("を入力してください")
    end
    it "passwordが空では登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end
    it "重複したnameでは登録できないこと" do
      user = create(:user)
      another_user = build(:user, name: user.name)
      another_user.valid?
      expect(another_user.errors[:name]).to include("はすでに存在します")
    end
    it "重複したemailでは登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end
    it "passwordが6文字以上であれば登録できること" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      expect(user).to be_valid
    end
    it "passwordが5文字以下だと登録できないこと" do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end
    it "nameが10文字以下なら登録できること" do
      user = build(:user, name: "abcdefghij")
      expect(user).to be_valid
    end
    it "nameが11文字以上だと登録できないこと" do
      user = build(:user, name: "abcdefghijk")
      user.valid?
      expect(user.errors[:name]).to include("は10文字以内で入力してください")
    end
  end
end
