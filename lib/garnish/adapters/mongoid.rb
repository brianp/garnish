module Garnish
  module Adapters
    module Mongoid
      extend ActiveSupport::Concern

      def self.included(superclass)
        puts superclass
      end

      module ClassMethods
        def reflect_on_all_associations(value)

          binding.pry
          case value
          when :has_many
            old_reflect_on_all_associations(:references_many)
          when :has_one
            old_reflect_on_all_associations(:references_one)
          when :belongs_to
            old_reflect_on_all_associations(:referenced_by)
          when :has_an_belongs_to_many
            old_reflect_on_all_associations(:references_and_referenced_by_many)
          else
            old_reflect_on_all_associations(value)
          end
        end

        alias :old_reflect_on_all_associations :reflect_on_all_associations
      end

    end
  end
end

module Mongoid::Document::ClassMethods
  include Garnish::Adapters::Mongoid
end
