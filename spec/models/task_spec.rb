require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    context '保存できる時' do
      it 'titleがあれば保存できること' do
        expect(build(:task, description: nil)).to be_valid
      end
      it 'titleとdescriptionがあれば保存できること' do
        expect(build(:task)).to be_valid
      end
    end
    context '保存できない時' do
      it 'titleがないと保存できないこと' do
        task = build(:task, title: nil)
        task.valid?
        expect(task.errors[:title]).to include("を入力してください")
      end
      it 'user_idがないと保存できないこと' do
        task = build(:task, user_id: nil)
        task.valid?
        expect(task.errors[:user]).to include("を入力してください")
      end
    end
  end
end