ActiveAdmin.register Combination do
  permit_params :name, :form,
                components_attributes: [:id, :raw_material_id, :volume, :_destroy]

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs          # builds an input field for every attribute

    f.has_many :components, heading: 'Master Formula Record', allow_destroy: true do |c|
      c.inputs :raw_material, :volume
    end

    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end

  show do
    attributes_table do
      row :id
      row :name
      row :form
      row :created_at
      row :updated_at
    end

    panel 'Master Formula Record' do
      table_for combination.components do
        column :raw_material
        column :volume
      end
    end

    active_admin_comments
  end
end
