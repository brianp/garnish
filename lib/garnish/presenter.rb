module Garnish
  module Presenter
    extend ActiveSupport::Concern

    included do
      attr_accessor :template
    end

    module InstanceMethods

      def included(base)
        base.send :include, Garnish::Presenter::Relationships
        super
      end

      protected

      def method_missing(method, *args, &block)
        self.template.send(method, *args, &block) unless @template.blank?
      end
    end

  end
end
