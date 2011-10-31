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
            klass = arry.first.class
            presenter_name = "#{klass.to_s}Presenter"

            if self.class_exists?(presenter_name.to_sym)
              arry = arry.map{ |v| presenter_name.constantize.new(v, self.template) }
            end

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
