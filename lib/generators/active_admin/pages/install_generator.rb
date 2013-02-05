module ActiveAdmin
  module Pages

    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def copy_admin_file
        copy_file "page_admin.rb", "app/admin/page.rb"
      end

      def copy_example_view
        copy_file "page_show.html.erb", "app/views/active_admin/pages/show.html.erb"
      end

      def add_default_configurations
        insert_into_file "config/routes.rb", :before => "\nend" do
          "\n  mount ActiveAdmin::Pages::Engine, at: \"/\""
        end if yes? "Add the default mount point?"

        insert_into_file "app/controllers/application_controller.rb", :after => "class ApplicationController < ActionController::Base\n" do
          "  helper ActiveAdmin::Pages::Engine.helpers\n"
        end if yes? "Add page helpers to application controller?"
      end
    end

  end
end
