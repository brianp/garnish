module Garnish
  module Presenter
    module Relationships
      extend ActiveSupport::Concern
      include Garnish::Converter

      included do
        relationships = Garnish::ModelAdapters::AbstractAdapter.adapter_class.defined_relationships(self)

        relationships.map do |key|
          define_method "#{key}" do |opts = nil, *rest|
            records = self.send(key)
            arry = convert(records)
            records
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
