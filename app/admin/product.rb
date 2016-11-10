ActiveAdmin.register Product do
  permit_params :name,
                :manufactured_by_id,
                :marketed_by_id,
                :combination_id,
                :packaging_type,
                :size,
                :primany_packing,
                :secondary_packing
end
