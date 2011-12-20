module Garnish
  module ModelAdapters
    class DefaultAdapter

      def self.defined_relationships(klass)
        klass.reflections.keys
      end

    end
  end
end

