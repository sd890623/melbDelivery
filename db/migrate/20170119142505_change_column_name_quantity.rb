class ChangeColumnNameQuantity < ActiveRecord::Migration[5.0]
  def change
    rename_column :items_orders, :quantaty, :quantity
  end
end
