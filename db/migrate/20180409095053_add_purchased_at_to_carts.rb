class AddPurchasedAtToCarts < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :purchased_at, :time
  end
end
