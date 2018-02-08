class ExpensesController < ApplicationController
  before_action :authenticate_user!
  def index
    @tab = :expenses
    @expenses = Expense.where(user_id: current_user.id)
    @expense = Expense.new
  end

  def create
    @expenses = Expense.where(user_id: current_user.id)
    @expense = Expense.new(expense_params)
    @expense.save!
    @prueba =3
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
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1"
    render :index
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
    puts params
    puts "***************************************************************"
    params.require(:expense).permit(:type_of_trans,:category,:concept,:amount,:date).merge(user_id: current_user.id)

  end
end
