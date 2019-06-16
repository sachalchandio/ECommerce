class AddSubDepartmentToProducts < ActiveRecord::Migration[5.1]
  def change
    add_reference :products, :sub_department, foreign_key: true
  end
end
