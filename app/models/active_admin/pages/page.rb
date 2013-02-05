module ActiveAdmin::Pages
  class Page < ActiveRecord::Base
    attr_accessible :title, :published, :position, :layout
    set_table_name "active_admin_pages"

    active_admin_translates :title do
      validates_presence_of :title
      has_seo_meta :title
      has_many :sections, class_name: "ActiveAdmin::Pages::Section", order: :position, dependent: :destroy
      accepts_nested_attributes_for :sections, :allow_destroy => true
      attr_accessible :sections_attributes
    end
    delegate :sections, to: :translation, allow_nil: true

    has_ancestry :orphan_strategy => :rootify

    def self.published
      where(published: true).order(:position)
    end

    def self.find_by_url(url, locale=I18n.locale)
      return nil if url.blank?
      I18n.with_locale(locale) do
        paths = url.split('/').reverse.reject{|s| s.blank?}
        the_page = nil
        paths.each_with_index do |path, i|
          page = self.find(path) rescue nil
          return nil if !page || !page.published
          if page.parent
            parent_slug = (page.parent.seo_meta.slug rescue nil) || (page.parent.translation.seo_meta.slug rescue nil)
            return nil if parent_slug != paths[i+1]
          end
          the_page ||= page
        end
        the_page
      end
    end

    def url(locale=I18n.locale, page=self, path="")
      slug = (page.seo_meta.slug rescue nil) || (page.translation_for(locale).seo_meta.slug rescue nil) || ""
      path = File.join "/", slug, path
      if page.parent
        url(locale, page.parent, path)
      else
        File.join "/", locale.to_s, path
      end
    end
  end
end
