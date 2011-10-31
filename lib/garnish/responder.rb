module Garnish
  class Responder < ActionController::Responder
    include Garnish::Converter
    def to_html
      vars = controller.instance_variables.reject {|x| x.to_s.include?("@_")}

      vars.each do |var|
        record = controller.instance_variable_get(var.to_s)

        if record.respond_to?(:each)
          klass = record.first.class
        else
          klass = record.class
        end

        presenter_name = "#{klass.to_s}Presenter"

        if self.class_exists?(presenter_name.to_sym)
          if record.respond_to?(:each)
            presenter = record.map{ |v| presenter_name.constantize.new(v, controller.view_context) }
          else
            presenter = presenter_name.constantize.new(record, controller.view_context)
          end
        end

        controller.instance_variable_set(var.to_s, presenter)
      end

      super
    end

  end
end
