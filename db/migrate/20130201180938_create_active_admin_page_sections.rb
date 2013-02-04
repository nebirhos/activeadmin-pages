class CreateActiveAdminPageSections < ActiveRecord::Migration
  def change
    create_table :active_admin_page_sections do |t|
      t.string :title
      t.text :body
      t.integer :position
      t.references :translation

      t.timestamps
    end
    add_index :active_admin_page_sections, :translation_id
  end
end
