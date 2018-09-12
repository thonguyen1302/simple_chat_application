module ApplicationHelper
  def avatar_url(username)
    Faker::Avatar.image(username, "225x225", "jpg")
  end
end
