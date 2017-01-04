# frozen_string_literal: true
# Copyright (c) 2016 LoonyBin

class CreateComponents < ActiveRecord::Migration[5.0]
  def change
    create_table :components do |t|
      t.belongs_to :combination, foreign_key: true
      t.belongs_to :raw_material, foreign_key: true
      t.decimal :volume, precision: 9, scale: 3

      t.timestamps
    end
  end
end
