# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create user
user = User.create(email: "user@example.com", password: "123456")

# Create dummy tasks
Task.create(title: "Check email", sub_title: "Quisque feugiat sem ut ex fringilla, vel molestie sem volutpat", priority: 2, due_date: Time.zone.now + 1.day, user_id: user.id)
Task.create(title: "Conduct policy check & send emails", sub_title: "Donec purus lacus, finibus non porta a, tristique a augue", priority: 0, due_date: Time.zone.now + 2.days, user_id: user.id)
Task.create(title: "Ask candidates about driver licenses and blue card", sub_title: "Eed in nisi scelerisque, porttitor massa non, elementum lacus", priority: 2, due_date: Time.zone.now + 2.day, user_id: user.id)
Task.create(title: "Call references", sub_title: "Pellentesque mattis neque dui, sit amet efficitur", priority: 1, due_date: Time.zone.now + 3.day, user_id: user.id)
