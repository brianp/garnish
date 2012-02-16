module Garnish
  class Collection
    include Enumerable
    include Garnish::Converter

    attr_accessor :relation
    attr_accessor :template

    delegate :avg, :max, :min, :sum, :length, :size, :count, :to => :relation

    def initialize(relation, template)
      @relation = relation
      @template = template
    end

    # Call the method on the relation object and then convert the results
    #
    # @example
    #   blog.posts.each { |post| post.name }
    #
    # @return [Collection]
    [:to_a, :each].map do |method|
      define_method method do
        records = @relation.send(method)
        convert(records)
        records
      end
    end

    def respond_to?(method)
      @relation.respond_to?(method)
    end

    protected

    def method_missing(method, *args, &block)
      resp = @relation.send(method, *args, &block)

      if resp.equal? @relation
        self
      elsif resp.instance_of? @relation.class
        Garnish::Collection.new(resp, @template)
      elsif resp.respond_to? :each
        Garnish::Collection.new(resp, @template)
      else
        convert(resp)
        resp
      end
    end
  end
end
