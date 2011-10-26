module Garnish
  module Controller
    extend ActiveSupport::Concern

    module ClassMethods
      def garnish(options = {}, &block)
        self.responder = Garnish::Responder
        respond_to :html
      end
    end
  end
end

if defined? ActionController
  ActionController::Base.class_eval do
    include Garnish::Controller
  end
end
