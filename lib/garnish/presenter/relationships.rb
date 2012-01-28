module Garnish
  module Presenter
    module Relationships
      extend ActiveSupport::Concern
      include Garnish::Converter

      included do
        relationships = Garnish::ModelAdapters::AbstractAdapter.adapter_class.defined_relationships(self)

        relationships.map do |key|
          alias_method "#{key}_orig".to_sym, key.to_sym
          define_method "#{key}" do |opts = nil, *rest|
            records = self.send("#{key}_orig")
            convert(records)
            records
          end
        end
      end

    end
  end
end
