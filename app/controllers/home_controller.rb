class HomeController < ApplicationController
  def index
    session[:conversations] ||= []
  
    @users = User.all.where.not(id: session[:user_id])
    @conversations = Conversation.includes(:receiver, :messages)
                                 .find(session[:conversations])
  end
end