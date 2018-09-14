class HomeController < ApplicationController
  before_action :check_username

  def index
  
    @users = User.all.where.not(id: cookies[:user_id])
  end

  private
  def check_username
    redirect_to join_path unless cookies[:user_id]
  end
end