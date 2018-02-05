# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 category = ["Restaurant", "Public services","Shopping", "Home", "Education", "Fun" , "Travel"]
 type_of = ["withdraw","Purchase"]

 user1= User.create(email:"angie@gmail.com",password:12345678)
 user2= User.create(email:"nicolas@one.com",password: 123456)
 user3= User.create(email:"ferney@one.com",password:123456)


	90.times do
		User.find(rand(3)+1).expenses.create(amount: Faker::Number.number(4),
							 concept: Faker::Commerce.product_name,
							 date: Faker::Date.backward(60),
							 type_of_trans: type_of.sample,
							 category: category.sample)
	end
