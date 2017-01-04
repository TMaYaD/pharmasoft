# frozen_string_literal: true
# Copyright (c) 2016 LoonyBin

class CreateRawMaterials < ActiveRecord::Migration[5.0]
  def change
    create_table :raw_materials do |t|
      t.string :name
      t.integer :form
      t.integer :category

      t.timestamps
    end
  end
end
