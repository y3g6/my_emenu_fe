# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
Category.destroy_all
Restaurant.destroy_all

10.times do |n|
  User.create name: "Name #{n}"
end

10.times do |n|
  Category.create name: "Name #{n}"
end

10.times do |n|
  user_id = User.first.id
  category_id = Category.last.id
  Restaurant.create name: "Name #{n}", owner_id: user_id, category_id: category_id
end
