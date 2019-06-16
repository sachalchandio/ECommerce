class RemoveDepartmentFromBrands < ActiveRecord::Migration[5.2]
  def change
    remove_reference :brands, :department, foreign_key: true
  end
end
