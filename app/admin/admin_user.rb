# frozen_string_literal: true
# Copyright (c) 2016 LoonyBin

ActiveAdmin.register AdminUser do
  permit_params :email, :role, :password, :password_confirmation

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
      f.input :email
      f.input :role
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
