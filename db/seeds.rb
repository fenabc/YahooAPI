# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "post作成"
Post.create!(user_id:1, title:"hello!", explanations:"helloooooo")
Post.create!(user_id:2, title:"hello!", explanations:"helloooooo")
puts "user作成"
User.create!(name:"ikuto", email:"ikuto.com")
User.create!(name:"takashi", email:"takataka@takasi")