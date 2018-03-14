class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.string :type_of_trans
      t.string :concept
      t.string :category
      t.date :date
      t.integer :amount
      t.belongs_to :user

      t.timestamps
    end
  end
end
