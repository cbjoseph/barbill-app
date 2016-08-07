class AddPasswordToBartenders < ActiveRecord::Migration[5.0]
  def change
    add_column :bartenders, :password_digest, :string
    add_column :bartenders, :email, :string
  end
end
