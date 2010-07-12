module CouchRails
  module FinderMethods

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

      def find(id)
        get(id)
      end

      def get(id)
        begin
          get!(id)
        rescue
          nil
        end
      end

    end
  end
end