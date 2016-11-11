ActiveAdmin.register RawMaterialBatch do
  permit_params :quantity, :batch_no, :manufactured_on, :expiry_on, :raw_material_id, :vendor_id

  index do
    id_column
    column :raw_material
    column :batch_no
    column :quantity
    column :vendor
    column :total_used_cache
    column :manufactured_on
    column :expiry_on
    column :created_at
    column :updated_at

    actions
  end
end
