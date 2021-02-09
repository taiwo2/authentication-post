class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params_post)
    if @post.save
      redirect root_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:text)
  end
end
