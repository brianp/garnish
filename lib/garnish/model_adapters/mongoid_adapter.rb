module Garnish
  module ModelAdapters
    class MongoidAdapter < AbstractAdapter

      def self.defined_relationships(klass)
        klass.relations.keys
      end

    end
  end
end
