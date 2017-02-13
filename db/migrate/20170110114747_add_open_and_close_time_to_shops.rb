class AddOpenAndCloseTimeToShops < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :open_hour, :integer, default: '9'
    add_column :shops, :close_hour, :integer, default: '22'
    add_column :shops, :delivery_method, :string, default: 'default'
    remove_column :shops, :status, :string
  end
end
