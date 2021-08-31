class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.references :merchant, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :purchaser, null: false, foreign_key: true
      t.references :data_file, null: false, foreign_key: true
      t.integer :product_quantity

      t.timestamps
    end
  end
end
