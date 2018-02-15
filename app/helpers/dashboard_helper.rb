module DashboardHelper

	def data(expenses)
		accu = []
		expenses.each do |expense|
			accu << {x: expense.date.day, y: expense.amount}
		end
		puts accu

		accu

	end
end
