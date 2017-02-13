class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.text :description
      t.integer :stock

      t.timestamps
    end
  end
end
