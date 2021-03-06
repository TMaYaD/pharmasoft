# frozen_string_literal: true
# Copyright (c) 2016 LoonyBin

ActiveAdmin.register RawMaterialBatch
ActiveAdmin.register RawMaterialUsage do
  active_admin_import

  belongs_to :raw_material_batch
  permit_params :quantity, :description, :used_on, :raw_material_id

  controller do
    def index
      parent ? redirect_to(parent_path) : super
    end
  end

  form do |f|
    f.semantic_errors

    f.inputs :used_on, :description, :quantity

    f.actions
  end
end
