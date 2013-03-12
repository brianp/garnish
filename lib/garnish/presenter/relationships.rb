module Garnish
  module Presenter
    module Relationships

      def self.extended(base)
        base.extend Garnish::Converter
        base.class_eval do
          relationships = Garnish::ModelAdapters::AbstractAdapter.adapter_class.defined_relationships(self)

          relationships.map do |key|
            alias_method "#{key}_orig".to_sym, key.to_sym
            define_method "#{key}" do |*rest|
              records = self.send("#{key}_orig")
              Garnish::Collection.new(records, template)
            end
          end
        end
      end

    end
  end
end
