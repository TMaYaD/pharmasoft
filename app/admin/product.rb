# frozen_string_literal: true
# Copyright (c) 2016 LoonyBin

ActiveAdmin.register Product do
  active_admin_import

  permit_params :name,
                :manufactured_by_id,
                :marketed_by_id,
                :combination_id,
                :packaging_type,
                :size,
                :primany_packing,
                :secondary_packing
end
