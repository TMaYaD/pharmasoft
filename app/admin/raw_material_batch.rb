ActiveAdmin.register RawMaterialBatch do
  active_admin_import

  permit_params :quantity, :batch_no, :manufactured_on, :expiry_on, :raw_material_id, :vendor_id

  index do
    id_column

    column :raw_material
    column :batch_no
    column :quantity
    column :vendor
    column :available_quantity_cache
    column :manufactured_on
    column :expiry_on
    column :created_at
    column :updated_at

    actions
  end

  action_item :new_usage, only: :show do
    link_to 'New Usage', [:new, :admin, resource, :raw_material_usage]
  end

  show do
    attributes_table do
      row :raw_material
      row :batch_no
      row :quantity
      row :vendor
      row :available_quantity_cache
      row :manufactured_on
      row :expiry_on
      row :created_at
      row :updated_at
    end

    panel 'Usage' do
      table_for raw_material_batch.raw_material_usages do
        column :used_on
        column :description
        column :quantity
      end
    end
  end
end
