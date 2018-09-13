class HomeController < ApplicationController
  def index
  
    @users = User.all.where.not(id: cookies[:user_id])
  end
end