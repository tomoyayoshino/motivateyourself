require 'rails_helper'

describe TasksController, type: :controller do
  let(:user) { create(:user) }
  before do
    login user
  end

  describe 'GET #new' do
    it "newアクションで正しくビューに遷移すること" do
      get :new
      expect(response).to render_template :new
    end
  end
  describe 'GET #edit' do
    it "@taskの値を確かめること" do
      task = create(:task)
      get :edit, params: { id: task }
      expect(assigns(:task)).to eq task
    end
    it "editアクションで正しくビューに遷移すること" do
      task = create(:task)
      get :edit, params: { id: task }
      expect(response).to render_template :edit
    end
  end
end


