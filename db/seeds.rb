1.upto(5) do |i|
  User.create(
    username: "user-#{i}"
  )
end