module Garnish
  module ModelAdapters
    class AbstractAdapter

      def self.inherited(subclass)
        @subclasses = subclass
      end

      def self.adapter_class
        val = @subclasses || Garnish::ModelAdapters::DefaultAdapter
      end
    end
  end
end
