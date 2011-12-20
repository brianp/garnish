module Garnish
  module ModelAdapters
    module MongoidAdapter
      extend ActiveSupport::Concern

      included do
      end

      module ClassMethods
        def defined_relationships
          self.relations.keys
        end
      end
    end
  end
end

module Mongoid::Document::ClassMethods
  include Garnish::ModelAdapters::MongoidAdapter::ClassMethods
end
