require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    context '保存できる時' do
      it 'contentがあれば保存できること' do
        expect(build(:message, image: nil)).to be_valid
      end
      it 'imageがあれば保存できること' do
        expect(build(:message, content: nil)).to be_valid
      end
      it 'contentとimageがあれば保存できること' do
        expect(build(:message)).to be_valid
      end
    end
    context '保存できない時' do
      it 'contentもimageもない場合保存できないこと' do
        message = build(:message, content: nil, image: nil)
        message.valid?
        expect(message.errors[:content]).to include("を入力してください")
      end
      it 'user_idがない場合保存できないこと' do
        message = build(:message, user_id: nil)
        message.valid?
        expect(message.errors[:user]).to include("を入力してください")
      end
      it 'room_idがない場合保存できないこと' do
        message = build(:message, room_id: nil)
        message.valid?
        expect(message.errors[:room]).to include("を入力してください")
      end
    end
  end
end