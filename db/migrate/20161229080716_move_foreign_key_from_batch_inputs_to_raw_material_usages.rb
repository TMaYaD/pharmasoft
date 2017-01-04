# frozen_string_literal: true
# Copyright (c) 2016 LoonyBin

class MoveForeignKeyFromBatchInputsToRawMaterialUsages < ActiveRecord::Migration[5.0]
  def change
    add_belongs_to :raw_material_usages, :batch_input, index: true, foreign_key: true
    remove_belongs_to :batch_inputs, :raw_material_usage, index: true, foreign_key: true
  end
end
