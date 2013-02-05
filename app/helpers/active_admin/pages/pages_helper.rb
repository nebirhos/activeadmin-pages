module ActiveAdmin::Pages
  module PagesHelper

    def page_path(page, locale=I18n.locale)
      page.url(locale)
    end

    def page_menu_tree(html_options={}, pages=ActiveAdmin::Pages::Page.roots.published)
      content_tag(:ul, html_options) do
        pages.map do |page|
          slug = (page.seo_meta.slug rescue nil) || (page.translation.seo_meta.slug rescue nil) || ""
          html_class = "open highlighted" if slug == request.path.split("/").last

          content_tag(:li) do
            link_to(page.title, page_path(page), class: html_class) <<
              page_menu_tree({}, page.children.published)
          end

        end.join.html_safe
      end
    end

  end
end
