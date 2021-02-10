class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[ :new, :create ]

  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(params_post)

    @post.user = current_user

    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def params_post
    params.require(:post).permit(:text)
  end
end
