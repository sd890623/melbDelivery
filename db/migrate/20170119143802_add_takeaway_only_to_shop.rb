class AddTakeawayOnlyToShop < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :takeaway_only, :boolean, null: false, default: false
  end
end
