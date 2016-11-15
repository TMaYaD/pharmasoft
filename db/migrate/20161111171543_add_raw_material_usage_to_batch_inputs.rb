class AddRawMaterialUsageToBatchInputs < ActiveRecord::Migration[5.0]
  def change
    add_reference :batch_inputs, :raw_material_usage, foreign_key: true
  end
end
