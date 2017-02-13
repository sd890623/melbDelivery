class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :phone, null: false
      t.string :address, null: false
      t.string :delivery_time, null: false
      t.string :delivery_method, null: false
      t.boolean :is_paid, default: false
      t.text :note
      t.float :delivery_fee, null: false, default: 0
      t.float :totle_fee, null: false, default: 0

      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
