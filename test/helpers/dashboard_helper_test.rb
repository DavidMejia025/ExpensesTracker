require 'test_helper'

class DashboardHelperTest < ActionView::TestCase

  setup do
    @expense = expenses(:two)
  end

  test "sum expenses amount" do
    assert_equal(44,totalAmount([@expense,@expense]))
  end
end
