class AddSizeToProductBatches < ActiveRecord::Migration[5.0]
  def change
    add_column :product_batches, :size, :integer
  end
end
