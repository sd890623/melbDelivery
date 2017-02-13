class RenameOrderItemsToItemsOrders < ActiveRecord::Migration[5.0]
  def change
    rename_table :order_items, :items_orders
  end
end
