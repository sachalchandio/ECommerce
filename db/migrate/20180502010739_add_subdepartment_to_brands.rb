class AddSubdepartmentToBrands < ActiveRecord::Migration[5.1]
  def change
    add_reference :brands, :sub_departments, foreign_key: true
  end
end
