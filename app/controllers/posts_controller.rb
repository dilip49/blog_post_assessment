# app/controllers/blog_posts_controller.rb
class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[show approve reject]
  after_action :verify_authorized, only: %i[approve reject]

  def index
    @posts = current_user.admin? ? Post.all : Post.approved
  end

  def show
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.status = 'pending'
    if @post.save
      redirect_to @post, notice: 'Blog post created successfully.'
    else
      render :new
    end
  end

  def approve
    authorize @post
    @post.update(status: 'approved')
    redirect_to posts_path, notice: 'Blog post approved.'
  end

  def reject
    authorize @post
    @post.update(status: 'rejected')
    redirect_to posts_path, notice: 'Blog post rejected.'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :file)
  end
end
