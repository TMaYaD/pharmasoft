# frozen_string_literal: true
# Copyright (c) 2016 LoonyBin

class CreateOverages < ActiveRecord::Migration[5.0]
  def change
    create_table :overages do |t|
      t.belongs_to :component, foreign_key: true
      t.belongs_to :batch, foreign_key: true
      t.decimal :volume, precision: 9, scale: 3

      t.timestamps
    end
  end
end
