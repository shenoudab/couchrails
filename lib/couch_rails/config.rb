module CouchRails
  class Config
    @db_map = {}
    class << self
      attr_accessor :db_map

      def db_for(model_name)
        db_name = @db_map[model_name.intern]
        db_name = model_name unless db_name
        db = CouchRest.database!(db_name.to_s)
        db
      end
    end

    def self.design_directory=(value)
      @design_directory = value
    end

    def self.design_directory
      instance_variable_defined?(:@design_directory) ? @design_directory : ""
    end

    def self.database_name=(value)
      @database_name = value
    end

    def self.database_name
      instance_variable_defined?(:@database_name) ? @database_name : ""
    end
  end
end