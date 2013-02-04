require "pry"

ActiveAdmin.register ActiveAdmin::Pages::Page, as: "Page" do
#  menu :label => "Pages"

  sortable tree: true,
           max_levels: 0 # set to limit the page nesting
  config.paginate = false       # FIXME

  index as: :sortable do
    label do |page|
      page.translations.map(&:title).join(' - ')
    end
    default_actions
  end

  filter :title
  filter :published

  collection_action :suca, :method => :get do
    binding.pry
  end

  form do |f|
    f.inputs "Content" do
      f.translated_inputs "Content" do |t|
        t.input :title
        t.inputs "Sections" do
          t.has_many :sections do |s|
            s.input :title
            s.input :body, :as => :wysihtml5
            s.input :position # FIXME
            unless s.object.nil?
              s.input :_destroy, :as => :boolean, :label => "Destroy?"
            end
          end
        end
        t.seo_meta_inputs basic_metas: true, slug_url_prefix: f.object.url_prefix
      end
      f.input :published
    end
    f.actions
  end
end
