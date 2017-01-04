# frozen_string_literal: true
# Copyright (c) 2016 LoonyBin

class AddRoleToAdminUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_users, :role, :integer, default: 0
  end
end
