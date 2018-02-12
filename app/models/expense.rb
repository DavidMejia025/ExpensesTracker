class Expense < ApplicationRecord
	belongs_to :user 
	belongs_to :type_of_tran
	belongs_to :category
	validates  :date, :concept, :amount, presence: true;
	validates :amount, numericality: {greater_than_or_equal_to: 0};
end
