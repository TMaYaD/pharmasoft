# frozen_string_literal: true
# Copyright (c) 2016 LoonyBin

ActiveAdmin.register RawMaterial do
  active_admin_import

  permit_params :name, :form, :category
end
