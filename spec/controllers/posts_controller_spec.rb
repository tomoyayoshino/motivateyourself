require 'rails_helper'

describe PostsController, type: :controller do
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
    it "@postの値を確かめる" do
      post = create(:post)
      get :edit, params: { id: post }
      expect(assigns(:post)).to eq post
    end
    it "editアクションで正しくビューに遷移すること" do
      post = create(:post)
      get :edit, params: { id: post }
      expect(response).to render_template :edit
    end
  end
  describe 'GET #index' do
    it "@postsの値を降順で確かめる" do
      posts = create_list(:post, 3)
      get :index
      expect(assigns(:posts)).to match(posts.sort{ |a, b| b.created_at <=> a.created_at } )
    end
    it "indexアクションで正しくビューに遷移すること" do
      get :index
      expect(response).to render_template :index
    end
  end
  describe 'GET #show' do
    it "@postの値を確かめる" do
      post = create(:post)
      get :show, params: { id: post }
      expect(assigns(:post)).to eq post
    end
    it "showアクションで正しくビューに遷移すること" do
      post = create(:post)
      get :show, params: { id: post }
      expect(response).to render_template :show
    end
  end
end


