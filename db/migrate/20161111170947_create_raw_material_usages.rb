# frozen_string_literal: true
# Copyright (c) 2016 LoonyBin

class CreateRawMaterialUsages < ActiveRecord::Migration[5.0]
  def change
    create_table :raw_material_usages do |t|
      t.belongs_to :raw_material_batch, foreign_key: true
      t.string :description
      t.decimal :quantity, precision: 10, scale: 3
      t.date :used_on

      t.timestamps
    end
  end
end
