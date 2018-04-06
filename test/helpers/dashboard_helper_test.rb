require 'test_helper'

class DashboardHelperTest < ActionView::TestCase

  setup do
    @expense = Expense.create(amount:12000, date:"06/06/2016", concept:"Game", user_id:1, category_id:298486374, type_of_tran_id:1)
  end

  test "sum expenses amount" do
    @expense
    assert_equal(24000,totalAmount([@expense,@expense]))
  end
end
