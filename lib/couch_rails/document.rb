module CouchRails
  class Document < CouchRest::ExtendedDocument
    include CouchRails::Naming
    include CouchRails::Validations
    include CouchRails::Associations
    include CouchRails::FinderMethods

    def self.use_database(db)
      self.database = CouchRest.database!(db.to_s)
    end

    def self.inherited(subclass)
      subclass.key = "_id" unless subclass.key && !subclass.key.empty?
      super
    end

    def self.use_key(attr)
      self.key = attr
    end

  end
end