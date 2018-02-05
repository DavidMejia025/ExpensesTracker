class ExpensesController < ApplicationController
  before_action :authenticate_user!
  def index
    @tab = :expenses
    @expenses = Expense.where(user_id: current_user.id)
    @expense = Expense.new
  end

  def create
    @expense = Expense.create(expense_params)
      if @expense.save
        redirect_to expense_path(@expense.id)
      else
        @errors = @expense.errors.full_messages
        render :index
      end
  end


  private
  def expense_params()
    params.require(:expense).permit(:type_of_trans,:category,:concept,:amout,:date).merge(user_id: current_user.id)
  end
end
