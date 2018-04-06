# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

 category = ["Restaurant", "Public services","Shopping", "Home", "Education", "Fun" , "Travel"]
 type_of = ["withdraw","Purchase"]
 TypeOfTran.create!(name:"Withdraw")
 TypeOfTran.create!(name:"Purchase")
 TypeOfTran.create!(name:"Loan")
 low_t = TypeOfTran.first.id
 high_t = TypeOfTran.last.id

 category.each do|cat|
 	Category.create!(name: cat)
 end
 low = Category.first.id
 high = Category.last.id

 # user1= User.create!(email:"ang@gmail.com",password:12345678)
 # user2= User.create!(email:"nicol@one.com",password: 123456)
 # user3= User.create!(email:"fer@one.com",password:123456)
 user= [User.first, User.find(4), User.last]
	1000.times do
		user.sample.expenses.create(amount: Faker::Number.number(5),
							 concept: Faker::Commerce.product_name,
							 date: Faker::Date.backward(200),
							 category_id: rand(low..high),
							 type_of_tran_id:rand(low_t..high_t)
							 )
	end
