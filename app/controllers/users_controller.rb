class UsersController < ApplicationController

  def join
    user = User.find_by_username(params[:username])
    unless user
      user = User.create(username: params[:username])
    end
    cookies[:user_id] = user.id
    redirect_to root_path
  end

  def show
    session[:conversations] ||= []
    @user = User.find(params[:id])

    @conversation = Conversation.where(sender_id: cookies[:user_id], receiver_id: @user.id).first

    @conversation = Conversation.get(cookies[:user_id], @user.id) unless @conversation.present?

    @messages = @conversation.messages.order(created_at: :desc).page(params[:page])
  end

end
