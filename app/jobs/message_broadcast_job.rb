class MessageBroadcastJob < ApplicationJob
  queue_as :default
 
  def perform(message)
    sender = message.user
    receiver = message.conversation.opposed_user(sender)
 
    broadcast_to_sender(sender, message)
    broadcast_to_receiver(receiver, message)
  end
 
  private
 
  def broadcast_to_sender(user, message)
    ActionCable.server.broadcast(
      "conversations-#{user.id}",
      message: render_message(message, user),
      conversation_id: message.conversation_id
    )
  end


  def broadcast_to_receiver(user, message)
    ActionCable.server.broadcast(
      "conversations-#{user.id}",
      window: render_window(message.conversation, user, message.conversation.messages.order(created_at: :desc)),
      message: render_message(message, user),
      conversation_id: message.conversation_id,
      sender_id: message.user.id
    )
  end

  def render_window(conversation, user, messages)
    ApplicationController.render(
      partial: 'conversations/conversation',
      locals: { conversation: conversation, user: user, messages: messages }
    )
  end
 
  def render_message(message, user)
    ApplicationController.render(
      partial: 'messages/message',
      locals: { message: message, user: user }
    )
  end
end
