require 'active_support'
require 'active_model'
require 'couchrest'

module CouchRails
  extend ActiveSupport::Autoload
  
  autoload :AbstractClass, "couch_rails/support/abstract_class"
  autoload :Document #, "couchrails/document"
  autoload :Config #, "couchrails/config"
  autoload :Associations #, 'couchrails/associations'

  autoload_under "queries" do
    autoload :FinderMethods
  end

  autoload_under "active_model" do
    autoload :Naming
    autoload :Validations
  end

  mattr_accessor :database_name
  @@database_name = ''

  mattr_accessor :design_directory
  @@design_directory = ''

  # Default way to setup Sooner. Run rails generate sooner_install to create
  # a fresh initializer with all configuration values.
  def self.setup
    yield self
  end
  
end
