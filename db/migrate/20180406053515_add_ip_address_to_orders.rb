class AddIpAddressToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :ip_address, :string
  end
end
