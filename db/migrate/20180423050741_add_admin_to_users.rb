class AddAdminToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :is_admin, :bit
  end
end
