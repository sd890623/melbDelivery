class ChangeDefaultColumns < ActiveRecord::Migration[5.0]
  def change
    change_column_default :items, :stock, 99
    change_column_default :orders, :delivery_fee, nil
    change_column_default :orders, :totle_fee, nil
  end
end
