class AddColumnType < ActiveRecord::Migration[5.0]
  def change
  	add_reference :expenses, :typeoftran,  foreign_key: true 
  end
end
