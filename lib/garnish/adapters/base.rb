module Garnish
  module Adapters
    class Base
      def self.reflect_on_all_associations(value)
        super
      end
    end
  end
end

