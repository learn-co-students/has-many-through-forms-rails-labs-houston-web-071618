# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

first_user = User.create(username: "Crate", email: "crate@create.com")
second_user = User.create(username: "The humblest", email: "hh@h.com")
third_user = User.create(username: "Everyone's Boss", email: "theboss@yourcompany.com")

first_post = Post.create(title: "First!", content: "This is the first post ever and this is real content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content content.... CONTENT.")
second_post = Post.create(title: "Not the pretentious one.", content: "Thank you for reading. I have nothing else to say.")
third_post = Post.create(title: "THIS IS A TITLE", content: "I HAVE BEEN TOLD THAT IT IS INAPPROPRIATE TO TYPE IN ALL CAPS, AS IT SEEMS LIKE I AM SCREAMING, BUT I DON'T KNOW HOW TO TURN THIS OFF. ALSO, I AM HARD OF HEARING, SO WHAT DOES IT REALLY MATTER? IS THIS FORMAT NOT EASIER TO READ ANYWAYS?")

new_cat = Category.create(name: "new")
old_cat = Category.create(name: "old")
cool_cat = Category.create(name: "cool")
