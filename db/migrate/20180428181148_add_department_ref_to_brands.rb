class AddDepartmentRefToBrands < ActiveRecord::Migration[5.1]
  def change
    add_reference :brands, :department, foreign_key: true
  end
end
