class AddImageToDrinks < ActiveRecord::Migration[5.0]
  def change
    add_column :drinks, :img_src, :string
  end
end
