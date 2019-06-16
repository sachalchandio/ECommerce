class AddDepartmentIdToSubDepartments < ActiveRecord::Migration[5.1]
  def change
    add_reference :sub_departments, :department, foreign_key: true
  end
end
