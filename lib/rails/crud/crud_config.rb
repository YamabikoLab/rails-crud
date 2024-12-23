require 'yaml'
require 'singleton'

class CrudConfig
  include Singleton

  attr_accessor :enabled, :base_dir, :crud_file, :method_col, :action_col, :table_start_col, :header_bg_color

  def initialize
    config_file = '.crudconfig'
    config = if File.exist?(config_file)
               YAML.load_file(config_file)
             else
               {}
             end

    @enabled = config.key?('enabled') ? config['enabled'] : true
    @base_dir = config['base_dir'] || 'doc'
    @crud_file = config['crud_file'] || 'crud.xlsx'
    @method_col = config['method_col'] || 'Verb'
    @action_col = config['action_col'] || 'Controller#Action'
    @table_start_col = config['table_start_col'] || 'active_admin_comments'
    @header_bg_color = config['header_bg_color'] || '00FFCC'
  end

  def self.enabled
    instance.enabled
  end

  def self.base_dir
    instance.base_dir
  end

  def self.crud_file
    instance.crud_file
  end

  def self.method_col
    instance.method_col
  end

  def self.action_col
    instance.action_col
  end

  def self.table_start_col
    instance.table_start_col
  end

  def self.header_bg_color
    instance.header_bg_color
  end

  def crud_file_path
    File.join(@base_dir, @crud_file)
  end

  def crud_log_path
    File.join(@base_dir, @crud_log)
  end
end