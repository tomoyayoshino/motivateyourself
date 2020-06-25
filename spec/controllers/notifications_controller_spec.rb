require 'rails_helper'
describe UsersController, type: :controller do
  let(:user) { create(:user) }
  before do
    login user
  end

  describe 'GET #index' do
    it "indexアクションで正しくビューに遷移すること" do
      get :index
      expect(response).to render_template :index
    end
  end
end