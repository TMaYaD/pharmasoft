# frozen_string_literal: true
# Copyright (c) 2016 LoonyBin

class ChangePackagingTypeToEnum < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :packaging_type, 'integer USING CAST(packaging_type AS integer)'
  end
end
