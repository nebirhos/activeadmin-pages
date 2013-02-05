require "ancestry"

module ActiveAdmin
  module Pages
    class Engine < ::Rails::Engine
      isolate_namespace ActiveAdmin::Pages
      engine_name 'activeadmin_pages'
    end
  end
end
