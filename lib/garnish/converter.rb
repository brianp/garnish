module Garnish
  module Converter
    extend ActiveSupport::Concern

    module ClassMethods
      def class_exists?(class_name)
        klass = Module.const_get(class_name)
        return klass.is_a?(Class)
      rescue NameError
        return false
      end
    end

    module InstanceMethods

      def convert(record, view = nil)
        view ||= self.template

        if record.respond_to?(:each)
          klass = record.first.class
        else
          klass = record.class
        end

        presenter_name = "#{klass.to_s}Presenter"

        if self.class_exists?(presenter_name.to_sym)
          if record.respond_to?(:each)
            presenter = record.map{ |v| presenter_name.constantize.new(v, view) }
          else
            presenter = presenter_name.constantize.new(record, view)
          end
        end

        presenter
      end

      def class_exists?(class_name)
        klass = Module.const_get(class_name)
        return klass.is_a?(Class)
      rescue NameError
        return false
      end
    end

  end
end
