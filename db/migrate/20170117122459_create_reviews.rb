class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.datetime :time, null: false
      t.integer :rating, null: false
      t.text :comment, null: false

      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
