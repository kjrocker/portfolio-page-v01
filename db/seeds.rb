# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ipsum = FFaker::HipsterIpsum

2.times do |n|
  Admin.create(email: "example_#{n}@example.com", password: "password")
end

12.times do
  this_project = {}
  this_project[:name] = ipsum.words(1).join(" ")
  this_project[:description] = ipsum.paragraphs(2).join("\n")
  this_project[:source_link] = "http://www.github.com/"
  this_project[:complete_link] = "http://www.google.com/"
  this_project[:active] = [true, false].sample
  this_project[:admin_id] = 1
  Project.create(this_project)
end
