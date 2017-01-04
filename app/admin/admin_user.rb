# frozen_string_literal: true
# Copyright (c) 2016 LoonyBin

ActiveAdmin.register AdminUser do
  permit_params :role, :lock

  index do
    selectable_column
    id_column
    column :role
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :role
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs 'Admin Details' do
      f.input :email, input_html: { readonly: true }
      f.input :role
      f.input :lock, as: :boolean
    end
    f.actions
  end
end
