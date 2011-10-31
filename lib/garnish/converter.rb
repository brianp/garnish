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
      def class_exists?(class_name)
        klass = Module.const_get(class_name)
        return klass.is_a?(Class)
      rescue NameError
        return false
      end
    end

  end
end
