require 'test_helper'

class ExpensesControllerTest < ActionDispatch::IntegrationTest

  test "route index is success" do
    get "/"
    assert_response(:redirect)
  end

  test "probe route expenses" do
    assert_routing({:method => :get, :path => '/'}, {:controller => 'dashboard', :action => 'index'})
  end

  
end
