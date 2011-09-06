class AddFormTemplateIdToFilledForm < ActiveRecord::Migration
  def change
    add_column :filled_forms, :form_template_id, :integer
  end
end
