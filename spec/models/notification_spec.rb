require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe '#create' do
    context '保存できる時' do
      it 'commentの通知が保存できること' do
        expect(build(:notification, action: 'comment', room_id: nil, message_id: nil,)).to be_valid
      end
      it 'favoriteの通知が保存できること' do
        expect(build(:notification, action: 'favorite', comment_id: nil, room_id: nil, message_id: nil,)).to be_valid
      end
      it 'followの通知が保存できること' do
        expect(build(:notification, action: 'follow', post_id: nil, comment_id: nil, room_id: nil, message_id: nil,)).to be_valid
      end
    end
  end
end
