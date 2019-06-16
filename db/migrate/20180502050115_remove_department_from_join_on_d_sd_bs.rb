class RemoveDepartmentFromJoinOnDSdBs < ActiveRecord::Migration[5.2]
  def change
    remove_reference :join_on_d_sd_bs, :department, foreign_key: true
  end
end
