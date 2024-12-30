require "rubyXL"
require "rubyXL/convenience_methods/cell"
require "rubyXL/convenience_methods/color"
require "rubyXL/convenience_methods/font"
require "rubyXL/convenience_methods/workbook"
require "rubyXL/convenience_methods/worksheet"
require 'rails/crud/crud_operations'
require_relative "tools/config"
require_relative "tools/cations"
require_relative "tools/ie"
require_relative "tools/crud_data"

module Rails
  module Crud
    module Tools
      def self.load_crud_data
        CrudData.instance.load_crud_data
      end

      self.load_crud_data
      setup_notifications
    end
  end
end