module ActiveAdmin::Pages
  class Section < ActiveRecord::Base
    attr_accessible :body, :position, :title
    set_table_name :active_admin_page_sections

    belongs_to :translation, class_name: "ActiveAdmin::Pages::Page::Translation"

    default_scope order(:position)
  end
end
