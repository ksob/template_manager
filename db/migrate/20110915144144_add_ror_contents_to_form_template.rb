class AddRorContentsToFormTemplate < ActiveRecord::Migration
  def change
    add_column :form_templates, :ror_contents, :text
  end
end
