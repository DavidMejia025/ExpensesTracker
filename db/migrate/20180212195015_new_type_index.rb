class NewTypeIndex < ActiveRecord::Migration[5.0]
  def change
  	add_reference :expenses, :type_of_tran,  foreign_key: true
  end
end
