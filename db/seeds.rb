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
    title: Faker::App.name,
    user: users.sample
  )
end

topics = Topic.all

30.times do
  bookmark = Bookmark.create!(
    url: Faker::Internet.url,
    topic: topics.sample
  )
end

puts "Seed Data Created"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"
