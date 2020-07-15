require 'rails_helper'
describe Post do
  describe '#create' do
    it "contentが空では投稿できないこと" do
      post = build(:post, content: "")
      post.valid?
      expect(post.errors[:content]).to include("を入力してください")
    end
  end
  describe '#update' do
    it "contentが空では投稿できないこと" do
      post = build(:post, content: "")
      post.valid?
      expect(post.errors[:content]).to include("を入力してください")
    end
  end
end
