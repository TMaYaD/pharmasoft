class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.belongs_to :manufactured_by, foreign_key: { to_table: :companies }
      t.belongs_to :marketed_by, foreign_key: { to_table: :companies }
      t.belongs_to :combination, foreign_key: true
      t.string :packaging_type
      t.string :size
      t.string :primany_packing
      t.string :secondary_packing

      t.timestamps
    end
  end
end
