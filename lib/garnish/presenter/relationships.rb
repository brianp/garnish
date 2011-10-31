module Garnish
  module Presenter
    module Relationships
      extend ActiveSupport::Concern
      include Garnish::Converter

      included do
        relationships = self.record_class.relations.keys

        relationships.map do |key|
          define_method key do
            arry = self.record.send(key)
            arry = convert(arry)
            arry
          end
        end
      end

      module ClassMethods
        def record_class
          str = self.to_s
          str.slice!("Presenter")
          str.constantize
        end
      end
    end
  end
end
