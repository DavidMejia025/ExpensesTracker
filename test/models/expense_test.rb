require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
  
  test "concept is string" do
    @expense = Expense.create(date:10/2/2017, concept:"toy", amount:15)
    is_string = @expense.concept.instance_of? String
    assert_equal(true ,is_string ,"Im testing amount")
  end

  test "concept presence true" do
    @expense = Expense.create(date:10/2/2017,concept:"toy", amount:15)
    assert(@expense.concept)
  end
end
