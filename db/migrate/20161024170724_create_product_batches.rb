class CreateProductBatches < ActiveRecord::Migration[5.0]
  def change
    create_table :product_batches do |t|
      t.belongs_to :batch, foreign_key: true
      t.belongs_to :product, foreign_key: true
      t.decimal :mrp, precision: 6, scale: 2
      t.decimal :input, precision: 9, scale: 2
      t.integer :output

      t.timestamps
    end
  end
end
