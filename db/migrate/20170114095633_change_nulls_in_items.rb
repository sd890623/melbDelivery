class ChangeNullsInItems < ActiveRecord::Migration[5.0]
  def change
    change_column_null :items, :name, false
    change_column_null :items, :price, false

    change_column_null :items, :stock, false
    change_column_default :items, :stock, 0
  end
end
