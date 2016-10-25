ActiveAdmin.register Product do
  permit_params :name,
                :manufactured_by,
                :marketed_by,
                :combination,
                :packaging_type,
                :size,
                :primany_packing,
                :secondary_packing
end
