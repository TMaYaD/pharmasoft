ActiveAdmin.register Vendor do
  active_admin_import

  permit_params :name, :address, :phone, :email
end
