ActiveAdmin.register Company do
  active_admin_import

  permit_params :name, :license
end
