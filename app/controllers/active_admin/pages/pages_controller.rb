module ActiveAdmin::Pages
  class PagesController < ApplicationController
    def show
      @page = ActiveAdmin::Pages::Page.find_by_url(params[:url])
      render "active_admin/pages/show", :layout => (@page.layout.presence || 'application')
    end
  end
end
