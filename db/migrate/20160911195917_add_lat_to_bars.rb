class AddLatToBars < ActiveRecord::Migration[5.0]
  def change
    add_column :bars, :lat, :float
  end
end
