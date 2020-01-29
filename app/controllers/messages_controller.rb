class MessagesController < ApplicationController
  before_action :set_post

  def new
    @message = Message.new
  end
  
  def create
    @message = @post.message.new(message_params)
    if @message.save
      redirect_to new_post_message_path(@posts.id)
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
