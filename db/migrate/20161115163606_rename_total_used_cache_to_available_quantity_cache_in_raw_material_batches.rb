# frozen_string_literal: true
# Copyright (c) 2016 LoonyBin

class RenameTotalUsedCacheToAvailableQuantityCacheInRawMaterialBatches < ActiveRecord::Migration[5.0]
  def change
    rename_column :raw_material_batches, :total_used_cache, :available_quantity_cache
  end
end
