class AddFinalVersionToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :department, :string
    add_column :products, :from_country, :string
  end
end
