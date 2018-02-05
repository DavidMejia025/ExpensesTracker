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

	# I want to learn how to pick an specific row in rails
	#sum = Expense.where(user_id: 2).select("amount")

	def summ(expenses)
			total = expenses.reduce(0) do |accu, expense|
				accu+= expense.amount
			end
			puts total
		total
	end

	def average(total,expenses)
		if expenses.count == 0
			divider = 1
		else
		divider = expenses.count
	end
	puts total
		(total/divider)
end

end
