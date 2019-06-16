class RemoveDepartmentFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :department, :string
  end
end
