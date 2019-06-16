class RemoveCountryFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :from_country, :string
  end
end
