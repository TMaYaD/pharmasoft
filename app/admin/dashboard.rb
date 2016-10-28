ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc{ I18n.t('active_admin.dashboard') }

  content title: proc{ I18n.t('active_admin.dashboard') } do
    section 'Recently updated content' do
      versions = active_admin_authorization.scope_collection(PaperTrail::Version)
                                           .order('id desc')
                                           .limit(20)
      table_for versions do # Use PaperTrail::Version if this throws an error
        column ('Item') { |v| link_to v.item, [:admin, v.item] } # Uncomment to display as link
        column ('Type') { |v| v.item_type.underscore.humanize }
        column ('Modified at') { |v| v.created_at.to_s :long }
        column ('Admin') { |v| v.whodunnit && link_to(AdminUser.find(v.whodunnit).email, [:admin, AdminUser.find(v.whodunnit)]) }
      end
    end
  end
end
