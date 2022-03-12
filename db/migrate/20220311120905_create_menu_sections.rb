class CreateMenuSections < ActiveRecord::Migration[7.0]
  def change
    create_table :menu_sections do |t|
      t.integer :section_id
      t.integer :menu_id
      t.timestamps
    end
  end
end
