class CreateComponents < ActiveRecord::Migration[5.0]
  def change
    create_table :components do |t|
      t.belongs_to :combination, foreign_key: true
      t.string :raw_material
      t.decimal :volume, precision: 9, scale: 3

      t.timestamps
    end
  end
end
