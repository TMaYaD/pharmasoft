ActiveAdmin.register Batch do
  permit_params :combination_id, :code, :size, :yield, :manufactured_on, :expiry_on,
    product_batches_attributes: [:id, :product_id, :size]

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

  form do |f|
    f.semantic_errors
    f.inputs

    f.has_many :product_batches, heading: 'Products', allow_destroy: true do |c|
        c.inputs :product, :size
    end

    f.actions
  end


  show do
    attributes_table do
      row :id
      row :combination
      row :code
      row :size
      row :yield do |batch|
        best_in_place batch, :yield, url: [:admin, batch]
      end
      row :manufactured_on
      row :expiry_on
      row :created_at
      row :updated_at
      row :unused_volume
    end

    panel 'Batch Sheet' do
      table_for batch.overages do
        column :raw_material
        column :base_volume
        column 'Overage' do |overage|
          best_in_place overage, :volume, url: [:admin, overage]
        end
      end
    end

    panel 'Product Batches' do
      table_for batch.product_batches do
        column :product
        column :size
      end
    end



    active_admin_comments
  end

end
