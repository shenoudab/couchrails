module Couchrails
  module Generators
    class InstallGenerator < Rails::Generators::Base

      desc "Creates a CouchRails initializer for your application."

      source_root File.expand_path("../templates", __FILE__)

      def copy_initializer
        template "couch_config.rb", "config/initializers/couch_config.rb"
      end

      def show_readme
        readme "README"
      end

      protected
  
      def readme(path)
        say File.read(File.expand_path(path, self.class.source_root))
      end
    end
  end
end