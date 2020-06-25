require 'rails_helper'

describe StaticpagesController, type: :controller do

  describe 'GET #about' do
    it "aboutアクションで正しくビューに遷移すること" do
      get :about
      expect(response).to render_template :about
    end
  end
  describe 'GET #help' do
    it "helpアクションで正しくビューに遷移すること" do
      get :help
      expect(response).to render_template :help
    end
  end
  
end


