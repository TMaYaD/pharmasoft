# frozen_string_literal: true
# Copyright (c) 2016 LoonyBin

ActiveAdmin.register Vendor do
  active_admin_import

  permit_params :name, :address, :phone, :email
end
