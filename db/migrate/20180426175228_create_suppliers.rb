class CreateSuppliers < ActiveRecord::Migration[5.1]
  def change
    create_table :suppliers do |t|
      t.string :company_name
      t.string :company_address
      t.string :city
      t.string :regin
      t.string :country
      t.string :postal_code
      t.string :phone_number
      t.string :email
      t.binary :active
      t.string :fax
      t.string :website
      t.decimal :ranking
      t.binary :current_oder

      t.timestamps
    end
  end
end
