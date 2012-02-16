module Garnish
  class Collection
    include Enumerable
    include Garnish::Converter

    attr_accessor :relation
    attr_accessor :template

    def initialize(relation, template)
      @relation = relation
      @template = template
    end

    # Call the method on the relation object and then convert the results
    #
    # @example
    #   blog.posts.each { |post| post.name }
    #
    # @return [Object]
    [:to_a, :each].map do |method|
      define_method method do
        records = @relation.send(method)
        convert(records)
        records
      end
    end

    protected

    def method_missing(method, *args, &block)
      resp = @relation.send(method, *args, &block)

      if resp.equal? @record
        self
      elsif resp.instance_of? @record.class
        Garnish::Collection.new(resp)
      else
        resp
      end
    end
  end
end

