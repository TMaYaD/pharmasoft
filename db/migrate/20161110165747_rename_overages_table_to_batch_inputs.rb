# frozen_string_literal: true
# Copyright (c) 2016 LoonyBin

class RenameOveragesTableToBatchInputs < ActiveRecord::Migration[5.0]
  def change
    rename_table :overages, :batch_inputs
    rename_column :batch_inputs, :volume, :overage
  end
end
