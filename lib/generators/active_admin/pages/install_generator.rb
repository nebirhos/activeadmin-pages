module ActiveAdmin
  module Pages

    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def copy_admin_file
        copy_file "page.rb", "app/admin/page.rb"
      end
    end

  end
end
