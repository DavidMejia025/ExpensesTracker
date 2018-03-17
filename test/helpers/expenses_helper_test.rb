require 'test_helper'

class ExpensesHelperTest < ActionView::TestCase
  test "convert num to month" do
     assert_equal("FEB",month_format(2))
  end
end


