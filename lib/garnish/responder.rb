module Garnish
  class Responder < ActionController::Responder
    include Garnish::Converter
    def to_html
      vars = controller.instance_variables.reject {|x| x.to_s.include?("@_")}

      vars.each do |var|
        record = controller.instance_variable_get(var.to_s)

        presenter = convert(record)

        controller.instance_variable_set(var.to_s, presenter)
      end

      super
    end

  end
end
