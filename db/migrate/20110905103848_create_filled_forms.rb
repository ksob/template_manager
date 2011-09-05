class CreateFilledForms < ActiveRecord::Migration
  def change
    create_table :filled_forms do |t|
      t.text :contents
      t.text :notes

      t.timestamps
    end
  end
end
