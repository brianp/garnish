module Garnish
  module Presenter
    extend ActiveSupport::Concern
    include Garnish::Presenter::Relationships

    included do
      attr_accessor :record
      attr_accessor :template
      attr_accessor :record_class
    end

    module InstanceMethods
      def initialize(r, t)
        self.record = r
        self.template = t
        self.record_class = r.class
      end

      def respond_to?(method, include_private = false)
        if self.methods.include?(method)
          super
        else
          self.record.respond_to?(method)
        end
      end

      protected

      def method_missing(method, *args, &block)
        begin
          # Check the record being presented first
          # If method doesn't exists check the template for helper convenience
          self.record.send(method, *args, &block)
        rescue NoMethodError
          self.template.send(method, *args, &block)
        end
      end
    end

    module ClassMethods

      protected

      def method_missing(method, *args, &block)
        record_class.send(method, *args, &block)
      end
    end

  end
end
