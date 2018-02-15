class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @tab = :dashboard
    @expenses = Expense.where(user_id: current_user.id)
  end
end
