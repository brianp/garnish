module Garnish
  module ModelAdapters
    class AbstractAdapter
      def self.inherited(subclass)
        @subclass = subclass
      end

      def self.adapter_class
        val = @subclass || Garnish::ModelAdapters::DefaultAdapter
      end
    end
  end
end
