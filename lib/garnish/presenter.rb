module Garnish
  module Presenter
    extend ActiveSupport::Concern

    included do
      attr_accessor :template
    end

    module ClassMethods
      def extended(base)
        base.extend Garnish::Presenter::Relationships
      end
    end

    protected

    def method_missing(method, *args, &block)
      self.template.send(method, *args, &block) unless @template.blank?
    end

  end
end
