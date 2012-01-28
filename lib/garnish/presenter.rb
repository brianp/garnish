module Garnish
  module Presenter
    extend ActiveSupport::Concern
    include Garnish::Presenter::Relationships

    included do
      attr_accessor :template
    end

    module InstanceMethods

      protected

      def method_missing(method, *args, &block)
        self.template.send(method, *args, &block) unless @template.blank?
      end
    end

  end
end
