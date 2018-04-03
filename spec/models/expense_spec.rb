# spec/models/todo_spec.rb
require 'rails_helper'


# RSpec.describe describe Expense do
# subject { described_class.new(concept:"food",date:"01/04/2018",amount:"15000",user_id: 7, category_id:2,type_of_tran_id:1)}
#   describe 'validations' do
#     describe 'amount' do
#       it 'must be present' do
#         subject.should be_valid
#       end
#     end
#   end
# end


RSpec.describe Expense, type: :model do
  # Association test
  # ensure Todo model has a 1:m relationship with the Item model
  # expense = Expense.new
  # it { expense.should belongs_to(:user)}
  # # Validation tests
  # # ensure columns title and created_by are present before saving
  # it { expense.should validate_presence_of(:amount) }
  # it { expense.should validate_presence_of(:concept) }

  describe "concept is string" do
    expense = Expense.create(category_id:1, type_of_tran_id:1, date:"10/2/2017", concept:"toy", amount:15)
    it {expect(expense.concept.instance_of? String).to eq(true)}
  end

  describe "concept presence true" do
    expense = Expense.create(category_id:2, type_of_tran_id:2, date:"10/2/2017", concept:"spiderman", amount:15)
    it { expect(expense.concept == nil).to eq(false)}
  end

end
