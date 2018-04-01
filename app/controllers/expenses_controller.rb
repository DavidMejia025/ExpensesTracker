class ExpensesController < ApplicationController
  before_action :authenticate_user!
  def index
    @tab = :expenses
    @expenses = Expense.where(user_id: current_user.id)
    @expenses = @expenses.order("date DESC")
    @expense = Expense.new
    @categories = Category.all
    @types = TypeOfTran.all
    if (params[:category_id].present?)
      @expenses = @expenses.where(category_id: params[:category_id])
    end
    if (params[:type_of_tran_id].present?)
      @expenses = @expenses.where(type_of_tran_id: params[:type_of_tran_id])
    end
    if params[:date_id].present?
      @expenses = filterDate(@expenses,params[:date_id])
  end
end

  def show

  end

  def create
    puts params
    @expenses = Expense.where(user_id: current_user.id)
    @expense = Expense.new(expense_params)
    @expense.save!
    respond_to do |format|
      format.js
    end

      # if @expense.save
      #
      # else
      #   @errors = @expense.errors.full_messages
      #   puts @errors
      #   @expenses = Expense.where(user_id: current_user.id)
      #   @expense = Expense.new
      #   render :index
      # end
  end

  def edit
    @expense = Expense.find(params[:id])

      respond_to do |format|
      format.js
    end
  end

  def update
    @expense = Expense.find(params[:id])
    @expense.update!(expense_params)
    @expenses = Expense.where(user_id: current_user.id)
    @expenses = @expenses.order("date DESC")

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    @expenses = Expense.where(user_id: current_user.id)
    respond_to do |format|
      # format.html {redirect_to expenses_path notice: "xxx"}
      format.js
    end
  end

  private
  def expense_params
    type_of_tran = TypeOfTran.find(params[:expense][:type_of_tran_id]).name
    params.require(:expense).permit(:type_of_tran_id,:category_id,:concept,:amount,:date).merge(user_id: current_user.id,type_of_trans:type_of_tran)

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
