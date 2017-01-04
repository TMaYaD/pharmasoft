# frozen_string_literal: true
# Copyright (c) 2016 LoonyBin

class CreateBatches < ActiveRecord::Migration[5.0]
  def change
    create_table :batches do |t|
      t.belongs_to :combination, foreign_key: true
      t.string :code
      t.integer :size
      t.decimal :yield, precision: 9, scale: 3
      t.date :manufactured_on
      t.date :expiry_on

      t.timestamps
    end
  end
end
