require 'test_helper'

class UserAuthenticationTest < ActionDispatch::IntegrationTest
  def setup
    @expenses = Expense.all
  end
  #
  test "authenticate user" do
    get new_user_session_path
    post user_session_path, user:{email:users(:one).email, password:"123456"}
    follow_redirect!
    assert_equal '/', path
   end

   test "test expenses and dashboard data" do
     get new_user_session_path
     post user_session_path, user:{email:users(:one).email, password:"123456"}
     follow_redirect!
     assert_equal '/', path
     get expenses_path

     assert_select ".count", "0"
   end

   test "create expense" do
     get new_user_session_path
     post user_session_path, user:{email:users(:one).email, password:"123456"}
     follow_redirect!
     assert_equal '/', path
     get expenses_path

     assert_select ".count", "0"
     post expenses_path, expense[concept:"soccer", amount:12000, date:"06/06/2016", category_id:298486374, user_id:1, type_of_tran_id:1]
     follow_redirect!
     get expenses_path
     assert_select ".count", "1"
   end

   test "delete expense" do
     get new_user_session_path
     post user_session_path, user:{email:users(:one).email, password:"123456"}
     follow_redirect!
     assert_equal '/', path
     get expenses_path

     assert_select ".count", "0"
     post expenses_path, expense[concept:"soccer", amount:12000, date:"06/06/2016", category_id:298486374, user_id:1, type_of_tran_id:1]
     follow_redirect!
     get expenses_path
     assert_select ".count", "1"

     delete expenses_id_path
     follow_redirect!
     get expenses_path
     assert_select ".count", "1"
   end

 end
