class CreateCombinations < ActiveRecord::Migration[5.0]
  def change
    create_table :combinations do |t|
      t.string :name
      t.integer :form, default: 0

      t.timestamps
    end
  end
end
