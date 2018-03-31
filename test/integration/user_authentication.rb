require 'test_helper'

class UserAuthenticationTest < ActionDispatch::IntegrationTest
  def setup
    @expenses = Expense.all
  end

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
   def root_search
    root = request.env["PATH_INFO"]
    puts root
  end
 end