class ChangeQuantityInItemsOrders < ActiveRecord::Migration[5.0]
  def change
    change_column_default :items_orders, :quantity, 1
  end
end
