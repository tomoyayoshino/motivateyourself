require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#create' do
    context '保存できる時' do
      it 'textがあれば保存できること' do
        expect(build(:comment)).to be_valid
      end
    end
    context '保存できない時' do
      it 'textがないと保存できないこと' do
        comment = build(:comment, text: nil)
        comment.valid?
        expect(comment.errors[:text]).to include("を入力してください")
      end
      it 'post_idがないと保存できないこと' do
        comment = build(:comment, post_id: nil)
        comment.valid?
        expect(comment.errors[:post]).to include("を入力してください")
      end
      it 'user_idがないと保存できないこと' do
        comment = build(:comment, user_id: nil)
        comment.valid?
        expect(comment.errors[:user]).to include("を入力してください")
      end
    end
  end
end
