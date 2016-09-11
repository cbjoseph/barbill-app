class AddLngToBars < ActiveRecord::Migration[5.0]
  def change
    add_column :bars, :lng, :float
  end
end
