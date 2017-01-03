ActiveAdmin.register RawMaterial do
  active_admin_import

  permit_params :name, :form, :category
end
