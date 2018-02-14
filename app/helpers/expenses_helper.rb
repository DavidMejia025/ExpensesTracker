module ExpensesHelper

	def month_format(date_month)
		month = {1 => "Jan",
				 2 => "Feb",
				 3 => "Mar",
				 4 => "Apr",
				 5 => "May",
				 6 => "jun",
				 7 => "Jul",
				 8 => "Aug",
				 9 => "Sep",
				 10 => "Oct",
				 11 => "Nov",
				 12 => "Dic"}
		month[date_month].upcase
	end

	def month_format2(date_month)
		month = {"Jan" => 1,
				 "Feb" => 2,
				 "Mar" => 3,
				 "Apr" => 4,
				 "May" => 5,
				 "jun" => 6,
				 "Jul" => 7,
				 "Aug" => 8,
				 "Sep" => 9,
				 "Oct" => 10,
				 "Nov" => 11,
				 "Dic" => 12}
		month[date_month].upcase
	end

	# I want to learn how to pick an specific row in rails
	#sum = Expense.where(user_id: 2).select("amount")

	def summ(expenses)
			total = expenses.reduce(0) do |accu, expense|
				accu+= expense.amount
			end
		total
	end

	def average(total,expenses)
		if expenses.count == 0
			divider = 1
		else
		divider = expenses.count
	end
		(total/divider)
end

def nameDate(expenses)
	 date_0 = expenses.map do |expense|
	 month= month_format(expense.date.month).capitalize
	 year = expense.date.year
	 "#{month} #{year}"
	end
	date_0.uniq
end

# def filterDate(expenses,targetDate)
# 	expenses = expenses.order("date DESC")
# 	 expenses_filter = expenses.reduce([]) do |accu, expense|
# 		 month= month_format(expense.date.month).capitalize
# 		 year = expense.date.year
# 		 dateString = "#{month} #{year}"
# 		 if targetDate == dateString
# 			 accu << expense
# 		 end
# 	 end
# 	 puts"´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´"
# 	 puts expenses_filter
# 	 expenses_filter
# end

 def instanceName(instances)
 	string= ""
 	instances.each do |type|
 		name = type.name 
 		puts name
 	 	string = string.concat(""+name+""+", ")
 	 end
 	 puts "((((((((((((((((((((((((((((((((((((((((((((((((((((((((((("
 	 puts string
 	 string
 end
end
