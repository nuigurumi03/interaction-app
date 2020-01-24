class PostsController < ApplicationController

  def index
    @posts = Post.includes(:images).order('created_at DESC')
  end

  def new
    @post = Post.new
    @post.images.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  
  def post_params
    params.require(:post).permit(:title, :detail, :prefecture, :city, :house_code, :build_name, images_attributes: [:image, :id]).merge(user_id:current_user.id)
  end
end
