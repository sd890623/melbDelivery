class CreateShops < ActiveRecord::Migration[5.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :status
      t.string :mobile
      t.string :address
      t.text :description

      t.timestamps
    end
  end
end
