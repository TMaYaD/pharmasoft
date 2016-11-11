class CreateRawMaterialBatches < ActiveRecord::Migration[5.0]
  def change
    create_table :raw_material_batches do |t|
      t.belongs_to :raw_material, foreign_key: true
      t.belongs_to :vendor, foreign_key: true
      t.decimal :quantity, precision: 8, scale: 3
      t.decimal :total_used_cache, precision: 8, scale: 3
      t.string :batch_no
      t.date :manufactured_on
      t.date :expiry_on

      t.timestamps
    end
  end
end
