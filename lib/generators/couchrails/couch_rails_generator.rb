module CouchRails
  module Generators
    class CouchRailsGenerator < Rails::Generators::NamedBase

      source_root File.expand_path("../templates", __FILE__)

      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"

      check_class_collision

      class_option :timestamps, :type => :boolean
      class_option :parent,     :type => :string, :desc => "The parent class for the generated model"

      def create_model_file
        template 'model.erb', File.join('app/models', class_path, "#{file_name}.rb")
      end

      hook_for :test_framework
      
    end

    class ActiveModel < Rails::Generators::ActiveModel
      def self.all(klass)
        "#{klass}.all"
      end

      def self.find(klass, params=nil)
        "#{klass}.get(#{params})"
      end

      def self.build(klass, params=nil)
        if params
          "#{klass}.new(#{params})"
        else
          "#{klass}.new"
        end
      end

      def save
        "#{name}.save"
      end

      def update_attributes(params=nil)
        "#{name}.update(#{params})"
      end

      def errors
        "#{name}.errors"
      end

      def destroy
        "#{name}.destroy"
      end
    end

  end
end

module Rails
  module Generators
    class GeneratedAttribute #:nodoc:
      def declaration
        declaration = @name
        declaration << ", :cast_as => '#{@type}'" unless !self.default.to_s.empty?
        declaration
      end
    end
  end
end