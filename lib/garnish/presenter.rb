module Garnish
  module Presenter
    extend ActiveSupport::Concern

    included do
      attr_accessor :record
      attr_accessor :template
      attr_accessor :record_class

      include Garnish::Presenter::InstanceMethods
      extend Garnish::Presenter::ClassMethods
    end

    module InstanceMethods
      def initialize(record, template)
        @record = record
        @template = template
        @record_class = record.class
      end

      def method_missing(*args, &block)
        begin
          # Check the record being presented first
          # If method doesn't exists check the template for helper convenience
          @record.send(*args, &block)
        rescue NoMethodError
          @template.send(*args, &block)
        end
      end

      def respond_to?(method, include_private = false)
        if select_methods.include?(method)
          record.respond_to?(method)
        else
          super
        end
      end
    end

    module ClassMethods
      def method_missing(method, *args, &block)
        record_class.send(method, *args, &block)
      end
    end

  end
end

