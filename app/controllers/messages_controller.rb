class MessagesController < ApplicationController
  def create
    @conversation = Conversation.includes(:receiver).find(params[:conversation_id])
    @messages = @conversation.messages.order(created_at: :desc).page(params[:page])
 
    respond_to do |format|
      format.js
    end
  end
 
  private
 
  def message_params
    params.require(:message).permit(:user_id, :content)
  end
end