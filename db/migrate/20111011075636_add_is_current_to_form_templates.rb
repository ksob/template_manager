class AddIsCurrentToFormTemplates < ActiveRecord::Migration
  def change
    add_column :form_templates, :is_current, :boolean, :default => true
  end
end
