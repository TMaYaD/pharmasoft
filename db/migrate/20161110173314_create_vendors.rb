# frozen_string_literal: true
# Copyright (c) 2016 LoonyBin

class CreateVendors < ActiveRecord::Migration[5.0]
  def change
    create_table :vendors do |t|
      t.string :name
      t.text :address
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
