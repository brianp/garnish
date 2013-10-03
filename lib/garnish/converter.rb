module Garnish
  module Converter
    extend ActiveSupport::Concern

    def module_exists?(class_name)
      klass = Module.const_get(class_name)
      return klass.is_a?(Module)
    rescue NameError
      return false
    end

    def convert(record, view = nil)
      view ||= self.template

      if record.respond_to?(:each)
        klass = record.first.class
      else
        klass = record.class
      end

      presenter_name = "#{klass.to_s}Presenter"

      if module_exists?(presenter_name.to_sym)
        if record.respond_to?(:each)
          record.map do |v|
            v.extend(presenter_name.constantize)
            v.template = view
          end
        else
          record.extend(presenter_name.constantize)
          record.template = view
        end
      end
    end

  end
end
