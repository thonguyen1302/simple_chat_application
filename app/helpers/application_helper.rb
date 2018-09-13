module ApplicationHelper
  def avatar_url(user_id)
    @avatar_url = "https://randomuser.me/api/portraits/men/" +  user_id.to_s + ".jpg"
  end

  def current_user
    return unless cookies[:user_id]
    current_user ||= User.find(cookies[:user_id])
  end
end
