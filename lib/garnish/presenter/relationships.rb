module Garnish
  module Presenter
    module Relationships
      extend ActiveSupport::Concern
      include Garnish::Converter

      included do
        relationships = Garnish::ModelAdapters::AbstractAdapter.adapter_class.defined_relationships(self.record_class)

        relationships.map do |key|
          define_method "#{key}_p" do
            arry = self.record.send(key) #.where(cond)
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
