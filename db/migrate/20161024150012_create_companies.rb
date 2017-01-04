# frozen_string_literal: true
# Copyright (c) 2016 LoonyBin

class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :license

      t.timestamps
    end
  end
end
