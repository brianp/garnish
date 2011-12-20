module Garnish
  module ModelAdapters
    class AbstractAdapter

      def self.inherited(subclass)
        @subclasses ||= []
        @subclasses << subclass
      end

      def self.adapter_class
        val = @subclasses.last #|| DefaultAdapter
      end
    end
  end
end
