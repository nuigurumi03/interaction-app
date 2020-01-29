class MessagesController < ApplicationController
  # before_action :set_post

  def new
    @post = Post.find(params[:post_id])
    @message = Message.new
  end
  
  def create
  end

  private

  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end

  # def set_post
  #   @post = Post.find(params[:post_id])
  # end

end
