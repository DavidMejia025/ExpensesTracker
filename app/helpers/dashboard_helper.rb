module DashboardHelper

	def data1(expenses)
		#Filter by month
		month_0 = expenses.first.date.month
		year_0 = expenses.first.date.year

		dataTest = []

		TypeOfTran.all.count.times do |i|
			dataTest << transactionData(expenses,month_0,year_0,i+1)
		end

		accu = []
		dataTest.each do |expense|
			accu << {x: 1, y: expense}
		end
		accu
	end

	def transactionData(expenses,month_0,year_0,i)
	expensesByTransaction = filterByTransaction(expenses, i)

	expensesMonthCero = filterByMonth(expensesByTransaction, month_0, year_0, 0)
	expensesMonthOne = filterByMonth(expensesByTransaction, month_0, year_0, 1)
	expensesMonthTwo = filterByMonth(expensesByTransaction, month_0, year_0, 2)


	dataTest = [totalAmount(expensesMonthCero),
	totalAmount(expensesMonthOne),
	totalAmount(expensesMonthTwo)]

	end

	def totalAmount(expenses)
			probe = expenses.reduce(0) do |accu,expense|
			accu += expense.amount
		end
			probe
	end

	def filterByMonth(expenses, month_0, year_0, i)

				filterExpenses =[]

					if i == 0
						month = month_format(expenses.first.date.month).capitalize
						targetDate = "#{month} #{year_0}"
						filterExpenses = filterDate(expenses, targetDate)
					elsif i == 1
						months = month_0 - i
						month = checkMonth(months)
						year = checkYear(year_0, months)
						month = month_format(month).capitalize
						targetDate = "#{month} #{year}"
					filterExpenses2 = filterDate(expenses, targetDate)
					elsif i == 2
						months = month_0 - i
						month = checkMonth(months)
						year = checkYear(year_0, months)
						month = month_format(month).capitalize
						targetDate = "#{month} #{year}"
					filterExpenses3 = filterDate(expenses, targetDate)
						end
			end

			def filterByTransaction(expenses, transaction)
				expenses = expenses.where(type_of_tran_id: transaction)
			end

	def checkMonth(month)
		if month == 0
			12
		elsif month == -1
			11
		elsif month == -2
			10
		elsif month == -3
			9
		elsif month == -4
			8
		elsif month == -5
			7
		elsif month == -6
			6
		else
			month
	end
end

	def checkYear(year, month)
		if month <= 0
			year -1
		else
			year
		end
	end

	def data2(expenses)
		month = month_format(expenses.first.date.month).capitalize
		year = expenses.first.date.year
		targetDate = "#{month} #{year}"
		expenses = filterDate(expenses, targetDate)
		accu = []
		expenses.each do |expense|
			accu << {x: expense.date.day, y: expense.amount}
		end
		accu
	end

end

def filterDate(expenses,targetDate)
	accu =[]
	 expenses_filter = expenses.each do |expense|
		 month= month_format(expense.date.month).capitalize
		 year = expense.date.year
		 dateString = "#{month} #{year}"
		 if targetDate == dateString
			accu << expense
		 end
	 end
	 accu
end

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
