Deface::Override.new(
  :virtual_path => "admin/configurations/index",
  :name => "inquiries_admin_configurations_menu",
  :insert_bottom => "[data-hook='admin_configurations_menu'], #admin_configurations_menu[data-hook]",
  :text => "<%= configurations_menu_item(t('inquiries'), admin_inquiry_settings_path, t('inquiry_settings')) %>",
  :disabled => false)