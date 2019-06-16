class AddCartIdToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :cart_id, :int
    add_column :orders, :card_type, :string
    add_column :orders, :card_expires_on, :date
  end
end
