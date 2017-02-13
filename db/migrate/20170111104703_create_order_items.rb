class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.references :item, foreign_key: true
      t.references :order, foreign_key: true
      t.integer :quantaty, null: false, default: 0

      t.index [:item_id, :order_id], unique: true

      t.timestamps
    end
  end
end
