class Expense < ApplicationRecord
	belongs_to :user 
	belongs_to :typeoftran
	belongs_to :category
	validates :type_of_trans, :date, :category, :concept, :amount, presence: true;
	validates :amount, numericality: {greater_than_or_equal_to: 0};
end
