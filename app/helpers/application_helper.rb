module ApplicationHelper
  def avatar_url(username)
    @avatar_url = "https://source.unsplash.com/320x210/weekly?" +  username

  end

  def current_user
    return unless cookies[:user_id]
    current_user ||= User.find(cookies[:user_id])
  end
end
