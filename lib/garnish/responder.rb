module Garnish
  class Responder < ActionController::Responder
    def to_html
      vars = controller.instance_variables.reject {|x| x.to_s.include?("@_")}

      vars.each do |var|
        record = controller.instance_variable_get((var.respond_to?(:each) ? var.first : var).to_s)
        klass = record.class
        presenter_name = "#{klass.to_s}Presenter"

        if class_exists?(presenter_name.to_sym)
          presenter = presenter_name.constantize.new(record, controller.view_context)
          controller.instance_variable_set(var.to_s, presenter)
        end
      end

      super
    end

    private

    def class_exists?(class_name)
      klass = Module.const_get(class_name)
      return klass.is_a?(Class)
    rescue NameError
      return false
    end

  end
end
