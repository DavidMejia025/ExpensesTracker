require 'test_helper'

class DashboardHelperTest < ActionView::TestCase

  setup do
    @expense = expenses(:two)
  end
  puts  "!!!!!!!!!!"
  puts  @expense
  puts  "!!!!!!!!!!"

  test "sum expenses amount" do
    assert_equal(44,totalAmount([@expense,@expense]))
  end
end
