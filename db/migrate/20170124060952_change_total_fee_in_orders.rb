class ChangeTotalFeeInOrders < ActiveRecord::Migration[5.0]
  def change
    rename_column :orders, :totle_fee, :total_fee
  end
end
