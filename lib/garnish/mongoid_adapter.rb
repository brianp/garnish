module Garnish
  module ModelAdapters
    module MongoidAdapter
      extend ActiveSupport::Concern

      module ClassMethods
        def defined_relationships
          self.relations.keys
        end
      end
    end
  end
end

module Mongoid::Document
  include Garnish::ModelAdapters::MongoidAdapter
end
