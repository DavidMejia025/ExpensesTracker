require 'test_helper'
class UserAuthenticationTest < ActionDispatch::IntegrationTest

 test 'filter expenses' do
     get new_user_session_path
     post user_session_path, user:{email:users(:one).email, password:"123456"}
     follow_redirect!
     assert_equal '/', path
 end
end
