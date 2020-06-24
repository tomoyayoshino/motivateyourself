require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe '#create' do
    context '保存できる時' do
      it 'post_idとuser_idがあれば保存できる' do
        expect(build(:favorite)).to be_valid
      end
    end
    context '保存できない時' do
      it 'post_idがないと保存できない' do
        favorite = build(:favorite, post_id: nil)
        favorite.valid?
        expect(favorite.errors[:post]).to include("を入力してください")
      end
      it 'user_idがないと保存できない' do
        favorite = build(:favorite, user_id: nil)
        favorite.valid?
        expect(favorite.errors[:user]).to include("を入力してください")
      end
    end
  end
end