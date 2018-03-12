class Api::V1::ExpensesController < ApplicationController
    protect_from_forgery with: :null_session

    def index
      result= token_validation(request.headers["X-Api-Token"], request.headers["X-User-Email"])
      user_email_id =  User.where(email: request.headers["X-User-Email"])

      if result
        render json: Expense.where(user_id: User.find(4))
    else
        render json: {errors: "Autentication_fail"}, status: 401
    end
  end

  def create
    @expense = Expense.create(expense_params)
    if @expense.save
      render json: @expense
    else
      render json: {errors: "Autentication_fail"}, status: 401
    end
  end

  def update
    @expense = Expense.find_by(params[:id])
     if @expense.update(expense_params)
       render json: @expense
     else
       render json: {errors: "Updating_fail"}, status: 401
  end
end

  def destroy
    @expense = Expense.find_by(params[:id])
    @expense.destroy
    render json: {errors: "Expense Succesfully Destroyed"}, status: 200
  end


  private
  def expense_params
    params.require(:expense).permit(:date, :concept, :category_id, :amount, :type_of_tran_id, :user_id, :type_of_trans  )
  end


    def token_validation(token,email)
      user = User.find_by(email:email)
      if (user && token == "123456")
          true
        else
          false
      end
    end
  end
