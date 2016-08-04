class CreateDrinks < ActiveRecord::Migration[5.0]
  def change
    create_table :drinks do |t|
      t.string :name
      t.integer :category_id
      t.integer :bar_id
      t.decimal :price, precision: 6, scale: 2

      t.timestamps
    end
  end
end
