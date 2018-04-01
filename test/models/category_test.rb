require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "Category is present" do
     @category = Category.create(name:"Restaurant")
     assert(@category.name)
  end
end
