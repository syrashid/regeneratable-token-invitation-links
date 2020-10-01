require 'faker'

puts "Clearing DB 🗑"
puts "----------------------------------"
Group.destroy_all
User.destroy_all

puts ""
puts "----------------------------------"
puts " Creating Users ⛹️‍♀️🏄‍♂️ "

30.times do
  User.create!(username: Faker::Internet.username(specifier: 10), email: Faker::Internet.email, password: 'password')
end

puts " Created #{User.count} users 👨‍❤️‍👨 "
puts "----------------------------------"

puts ""
puts "----------------------------------"
puts " Creating Groups 👨‍👩‍👧‍👦 "


6.times do
  Group.create(name: Faker::Movies::LordOfTheRings.location, topic: Faker::Movies::StarWars.quote)
end

puts " Created #{Group.count} groups 👨‍❤️‍👨 "
puts "----------------------------------"

puts ""
puts "----------------------------------"
puts " Creating Memberships ⛵️ "

User.all.each do |user|
  Membership.create(user: user, group: Group.all.sample)
end

Group.all.each do |group|
  rand(3..5).times do
    Membership.create(user: User.all.sample, group: group)
  end
end

puts " Created #{Membership.count} memberships 💪 "
puts "----------------------------------"

puts ""
puts "Done Seeding, Please proceed on your way"
puts ""
puts "In Wookie 🐻: '#{Faker::Movies::StarWars.wookiee_sentence}'"
