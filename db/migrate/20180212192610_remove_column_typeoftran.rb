class RemoveColumnTypeoftran < ActiveRecord::Migration[5.0]
  def change
  	remove_index :expenses, :typeoftran 
  	add_column :expenses, :type_of_tran,  foreign_key: true
  end
end
