class AddDepartmentSubdepartmentBrandsToJoinOnDSdBs < ActiveRecord::Migration[5.2]
  def change
    add_reference :join_on_d_sd_bs, :brand, foreign_key: true
    add_reference :join_on_d_sd_bs, :department, foreign_key: true
    add_reference :join_on_d_sd_bs, :sub_department, foreign_key: true
  end
end
