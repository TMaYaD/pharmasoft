class CreateCombinations < ActiveRecord::Migration[5.0]
  def change
    create_table :combinations do |t|
      t.string :name
      t.string :form
      t.string :release_mode

      t.timestamps
    end
  end
end
