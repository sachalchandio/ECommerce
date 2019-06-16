class CreateSubDepartments < ActiveRecord::Migration[5.1]
  def change
    create_table :sub_departments do |t|
      t.string :name

      t.timestamps
    end
  end
end
