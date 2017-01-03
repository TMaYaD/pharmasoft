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
