require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase

  test "concept is string" do
    @expense = Expense.create(date:"10/2/2017", concept:"toy", amount:15)
    is_string = @expense.concept.instance_of? String
    assert_equal(true ,is_string ,"Im testing amount")
  end

  test "concept presence true" do
    @expense = Expense.create(date:"10/2/2017",concept:"toy", amount:15)
    assert(@expense.concept)
  end

  test "valid expense" do
    expense = Expense.new(amount:12000, date:"06/06/2017", concept:"game", category_id:1, user_id:1, type_of_tran_id:1)
    assert expense.valid?
  end
end
