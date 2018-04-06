require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "valid User" do
    user = User.new(email:"oliva@one.com", password:"test1234")
    assert user.valid?
  end  
end
