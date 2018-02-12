class RenameColumnType < ActiveRecord::Migration[5.0]
  def change
  	remove_column :expenses, :typeoftran, :index 
  	remove_column :expenses, :type_of_trans, :string 
  	add_column :expenses, :type_of_tran,  foreign_key: true
  end
end
