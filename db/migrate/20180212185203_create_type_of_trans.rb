class CreateTypeOfTrans < ActiveRecord::Migration[5.0]
  def change
    create_table :type_of_trans do |t|
      t.string :name

      t.timestamps
    end
  end
end
