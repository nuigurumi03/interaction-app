class MessagesController < ApplicationController

  def new
    @message = Message.new
  end
  
  def create
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
