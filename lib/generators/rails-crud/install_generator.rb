module RailsCrud
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      def copy_javascript
        copy_file 'rails-crud.js', 'app/assets/javascripts/rails_crud.js'
      end

      def add_javascript_include_tag
        inject_into_file 'app/views/layouts/application.html.erb', before: '</head>' do
          "\n    <%= javascript_include_tag 'rails_crud' %>\n"
        end
      end

      def show_install_message
        puts "Rails CRUD has been successfully installed!"
      end
    end
  end
end