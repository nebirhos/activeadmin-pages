class CreateActiveAdminPages < ActiveRecord::Migration
  def migrate(direction)
    super
    if direction == :up
      ActiveAdmin::Pages::Page.create_translation_table! title: :string
    else
      ActiveAdmin::Pages::Page.drop_translation_table!
    end

  end

  def change
    create_table :active_admin_pages do |t|
      t.string :title
      t.boolean :published
      t.string :layout

      t.string :ancestry
      t.integer :position

      t.timestamps
    end
    add_index :active_admin_pages, :ancestry
  end
end
