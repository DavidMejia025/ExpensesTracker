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
			expense.each_with_index do |data,i|
				month = checkMonth(month_0-i)
				year = checkYear(year_0, month_0-i)
					accu << {x: month, y: data}
				end
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

	def data3(expenses)
		data = Category.all.map do |cat|
			item = totalAmount(filterByCategory(expenses,cat.id))
			{label: cat.name, y:item}
		end
		data
	end

	def data4(expenses)
		monthBase = expenses.first.date.month
		month_0 = month_format(monthBase).capitalize
		year_0 = expenses.first.date.year
		targetDate_0 = "#{month_0} #{year_0}"
		data_0 = filterDate(expenses, targetDate_0)
		month_1 = month_format(checkMonth( monthBase - 1)).capitalize
		year_1 = checkYear(year_0, monthBase - 1)
		targetDate_1 = "#{month_1} #{year_1}"
		data_1 = filterDate(expenses, targetDate_1)
		expense_0 = sumExpenses(data_1)

		data = []
		data[0] = dataSet(sumExpenses(data_0))
		data[1] = dataSet(sumExpenses(data_1))
		puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
		puts data[0]
		puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"

		data

	end

	def dataSet(data)
		accu = []
		data.each_with_index do |data, i|
			accu << {x: i, y:data}
		end
		accu
	end

	def sumExpenses(expenses)
		accu = []
		expenses.each_with_index do |expense, i|
		if i == 0
			accu[i] = expense.amount
		else
			accu[i] = expense.amount + accu[i - 1]
		end
	end
	accu
end


	def filterByCategory(expenses, categoryId)
		expenses = expenses.where(category_id: categoryId)
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

end
