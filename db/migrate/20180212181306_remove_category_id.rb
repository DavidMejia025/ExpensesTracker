class RemoveCategoryId < ActiveRecord::Migration[5.0]
  def change
  	remove_column :expenses, :category, :string
  end
end
