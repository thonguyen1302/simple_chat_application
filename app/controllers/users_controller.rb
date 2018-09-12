class UsersController < ApplicationController

  def join
    user = User.find_by_username(params[:username])
    unless user
      user = User.create(username: params[:username])
    end
    session[:user_id] = user.id
    redirect_to root_path
  end

end
