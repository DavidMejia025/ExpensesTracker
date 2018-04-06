require 'test_helper'

class ExpensesControllerTest < ActionDispatch::IntegrationTest
   test "Test index route" do
    get "/"
    assert_response :redirect
   end

   test "Creating a expense" do
     @expense = Expense.create(concept:"Food", amount:345, category_id: 298486374, type_of_tran_id:1,user_id:1,date:"12/4/2017")
     counter_1 = Expense.count
     @expense = Expense.create(concept:"Food", amount:345, category_id: 298486374, type_of_tran_id:1,user_id:1,date:"12/4/2017")
     counter_2 = Expense.count
     assert_equal(1002,counter_2)
     assert_instance_of(Expense,@expense)
   end
end
