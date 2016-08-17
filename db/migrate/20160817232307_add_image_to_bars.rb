class AddImageToBars < ActiveRecord::Migration[5.0]
  def change
    add_column :bars, :img_src, :string
  end
end
