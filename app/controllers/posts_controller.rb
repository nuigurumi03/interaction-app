class PostsController < ApplicationController

  def new
  end

  def create
    @post = Post.new(post_params)
    binding.pry
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
