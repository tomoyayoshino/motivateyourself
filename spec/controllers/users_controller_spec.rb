require 'rails_helper'
describe UsersController, type: :controller do
  describe 'GET #index' do
    it "@usersの値を確かめる" do
      users = create_list(:user, 3)
      get :index
      expect(assigns(:users)).to match(users)
    end
    it "indexアクションで正しくビューに遷移すること" do
      get :index
      expect(response).to render_template :index
    end
  end
  describe 'GET #show' do
    it "@userの値を確かめる" do
      user = create(:user)
      get :show, params: { id: user }
      expect(assigns(:user)).to eq user
    end
    it "showアクションで正しくビューに遷移すること" do
      user = create(:user)
      get :show, params: { id: user }
      expect(response).to render_template :show
    end
  end
end