module Garnish
  module Presenter
    module Relationships
      extend ActiveSupport::Concern

      module InstanceMethods
        relationships = @target.relations.keys

        relationships.map do |key|
          define_method key do
            arry = @target.send(key)

            new_arry = arry.map do |v|
              klass = v.class
              presenter_name = "#{klass.to_s}Presenter"

              if class_exists?(presenter_name.to_sym)
                presenter = presenter_name.constantize.new(record, controller.view_context)
              end
            end

            new_array
          end
        end
      end

      module ClassMethods
      end

    end
  end
end

