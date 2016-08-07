class AddStatusToCartedDrinks < ActiveRecord::Migration[5.0]
  def change
    add_column :carted_drinks, :status, :string
  end
end
