if Rails.env.development?
  10.times do
    user = User.new(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: "password"
    )
    user.skip_confirmation!
    user.save!
  end

  users = User.all

  10.times do
    topic = Topic.create!(
      title: Faker::App.name
    )
  end

  topics = Topic.all

end
admin = User.new(
  name: "admin user",
  email: "admin@test.com",
  password: "password",
  admin: true
)
admin.skip_confirmation!
admin.save!

puts "Seed Data Created"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"
