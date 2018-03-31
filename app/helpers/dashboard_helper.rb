module DashboardHelper

	def dayExpense(expenses,day)
		monthBase = expenses.first.date.month
		month_0 = month_format(monthBase).capitalize
		year_0 = expenses.first.date.year
		targetDate_0 = "#{month_0} #{year_0}"
		data_0 = filterDateMonth(expenses, targetDate_0)
		month_1 = month_format(checkMonth( monthBase - 1)).capitalize
		year_1 = checkYear(year_0, monthBase - 1)
		targetDate_1 = "#{month_1} #{year_1}"
		data_1 = filterDateMonth(expenses, targetDate_1)
		if day=="hoy"
			data_0 = filterByDay(data_0)[-1]
		elsif day=="ayer"
			data_0 = filterByDay(data_0)[-2]
		elsif day=="mes_actual"
			filterByDay(data_0).sum
		else
      unless data_1==nil || data_1 == []
			  filterByDay(data_1).sum
      else
        data_1=0;
      end
		end
	end



	def data1(expenses)
		#Filter by month
		month_0 = expenses.first.date.month
		year_0 = expenses.first.date.year

		dataTest = []

		TypeOfTran.all.each do |tran|
			dataTest << transactionData(expenses,month_0,year_0,tran.id)
		end
		accu = []
		dataTest.each do |expense|
			expense.each_with_index do |data,i|
				month = checkMonth(month_0-2+i)
				year = checkYear(year_0, month_0-2+i)
					# accu << {x: month, y: data}
					accu << {label: month_format(month), y: data}
				end
			end
		accu
	end


	def transactionData(expenses,month_0,year_0,tran_id)
	expensesByTransaction = filterByTransaction(expenses, tran_id)
	expensesMonthCero = filterByMonth(expensesByTransaction, month_0, year_0, 0)
	expensesMonthOne = filterByMonth(expensesByTransaction, month_0, year_0, 1)
	expensesMonthTwo = filterByMonth(expensesByTransaction, month_0, year_0, 2)
	dataTest = [totalAmount(expensesMonthCero),
	totalAmount(expensesMonthOne),
	totalAmount(expensesMonthTwo)]
	end

	def filterByTransaction(expenses, transaction)
		expenses = expenses.where(type_of_tran_id: transaction)
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
						filterExpenses = filterDateMonth(expenses, targetDate)
					elsif i == 1
						months = month_0 - i
						month = checkMonth(months)
						year = checkYear(year_0, months)
						month = month_format(month).capitalize
						targetDate = "#{month} #{year}"
					filterExpenses2 = filterDateMonth(expenses, targetDate)
					elsif i == 2
						months = month_0 - i
						month = checkMonth(months)
						year = checkYear(year_0, months)
						month = month_format(month).capitalize
						targetDate = "#{month} #{year}"
					filterExpenses3 = filterDateMonth(expenses, targetDate)
						end
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
		expenses = filterDateMonth(expenses, targetDate)
		data_set = []
		TypeOfTran.all.each_with_index do |type,i|
			accu = []
		    expenses.map do |expense|
				if expense.type_of_tran_id == type.id
					accu<<{x: expense.date.day, y: expense.amount}
				end
				accu
			end
			data_set[i] = accu
		end
		data_set
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
		data_0 = filterDateMonth(expenses, targetDate_0)
		month_1 = month_format(checkMonth( monthBase - 1)).capitalize
		year_1 = checkYear(year_0, monthBase - 1)
		targetDate_1 = "#{month_1} #{year_1}"
		data_1 = filterDateMonth(expenses, targetDate_1)
		data = []
    byebug
		data[0] = dataSet(sumExpenses(filterByDay(data_0)))
    unless data_1 == nil || data_1 == []
      byebug
      data[1] = dataSet(sumExpenses(filterByDay(data_1)))
    else
      byebug
      data[1] = 0
    end
		
		data

	end

	def filterByDay(expenses)
		day_0 = expenses.first.date.day
		data = []
		day_0.times do |day|
			data[day] = 0
			expenses.each do |expense|
				if expense.date.day == day+1
					data[day] += expense.amount
				end
			end
		end
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
			accu[i] = expense
		else
			accu[i] = expense + accu[i - 1]
		end
	end
	accu
end


	def filterByCategory(expenses, categoryId)
		expenses = expenses.where(category_id: categoryId)
	end

	def filterDateMonth(expenses,targetDate)
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
