class CreateCartedDrinks < ActiveRecord::Migration[5.0]
  def change
    create_table :carted_drinks do |t|
      t.integer :order_id
      t.integer :user_id
      t.integer :drink_id
      t.integer :quantity

      t.timestamps
    end
  end
end
