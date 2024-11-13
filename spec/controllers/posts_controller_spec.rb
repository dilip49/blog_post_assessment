require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) }
  let(:admin) { create(:user, role: "admin") }
  let(:post) { create(:post, user: user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    context 'when user is an admin' do
      before do
        sign_in admin
        create(:post, status: 'approved')
        create(:post, status: 'pending')
      end

      it 'assigns all blog posts to @posts' do
        get :index
        expect(assigns(:posts).count).to eq(2)
      end
    end

    context 'when user is not an admin' do
      before do
        create(:post, status: 'approved')
        create(:post, status: 'pending')
      end

      it 'assigns only approved blog posts to @posts' do
        get :index
        expect(assigns(:posts).count).to eq(1)
        expect(assigns(:posts).first.status).to eq('approved')
      end
    end
  end

  describe 'GET #show' do
    it 'assigns the requested blog post to @blog_post' do
      get :show, params: { id: post.id }
      expect(assigns(:post)).to eq(post)
    end
  end

  describe 'GET #new' do
    it 'assigns a new BlogPost to @blog_post' do
      get :new
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new blog post' do
        expect { post :create, params: { post: FactoryBot.attributes_for(:post).merge(user_id: user.id) }}.to change(Post, :count).by(1)
      end

      it 'redirects to the new blog post' do
        post :create, params: { post: FactoryBot.attributes_for(:post) }
        expect(response).to redirect_to(Post.last)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new blog post' do
        expect {
          post :create, params: { post: FactoryBot.attributes_for(:post, title: nil) }
        }.to_not change(Post, :count)
      end

      it 're-renders the new template' do
        post :create, params: { post: FactoryBot.attributes_for(:post, title: nil) }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH #approve' do
    before do
      sign_in admin
    end

    it 'updates the blog post status to approved' do
      patch :approve, params: { id: post.id }
      post.reload
      expect(post.status).to eq('approved')
    end

    it 'redirects to the blog posts index' do
      patch :approve, params: { id: post.id }
      expect(response).to redirect_to(posts_path)
    end
  end

  describe 'PATCH #reject' do
    before do
      sign_in admin
    end

    it 'updates the blog post status to rejected' do
      patch :reject, params: { id: post.id }
      post.reload
      expect(post.status).to eq('rejected')
    end

    it 'redirects to the blog posts index' do
      patch :reject, params: { id: post.id }
      expect(response).to redirect_to(posts_path)
    end
  end
end
