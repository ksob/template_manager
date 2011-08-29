class CreateFormTemplates < ActiveRecord::Migration
  def change
    create_table :form_templates do |t|
      t.string :name
      t.text :description
      t.text :contents

      t.timestamps
    end
  end
end
