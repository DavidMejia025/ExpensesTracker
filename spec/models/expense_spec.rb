# spec/models/todo_spec.rb
require 'rails_helper'

# Test suite for the Todo model
RSpec.describe Expense, type: :model do
  # Association test
  # ensure Todo model has a 1:m relationship with the Item model
  it { should belongs_to(:user)}
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:concept) }
end
