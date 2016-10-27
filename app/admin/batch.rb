ActiveAdmin.register Batch do
  permit_params :combination_id, :code, :size, :yield, :manufactured_on, :expiry_on

  index do
    id_column
    column :combination
    column :code
    column :size
    column :yield
    column :manufactured_on
    column :expiry_on
    column :created_at
    column :updated_at

    actions
  end

  show do
    attributes_table do
      row :id
      row :combination
      row :code
      row :size
      row :yield
      row :manufactured_on
      row :expiry_on
      row :created_at
      row :updated_at
    end

    panel 'Batch Sheet' do
      table_for batch.overages do
        column :raw_material
        column :base_volume
        column 'Overage' do |overage|
          best_in_place overage, :volume, as: :input, url: [:admin, overage]
        end
      end
    end

    active_admin_comments
  end
end
