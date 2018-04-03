require 'rails_helper'

RSpec.describe Category,type: :model do
  describe "Category presence true" do
    category = Category.create(name: "Home")
    it{ expect((category.name)==nil).to eq(false)}
  end

  
end