class AddSuburbToShops < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :address_suburb, :string
    change_column_null :shops, :address_suburb, false
    rename_column :shops, :address, :address_street
  end
end
