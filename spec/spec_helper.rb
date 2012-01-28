require 'rubygems'
require 'bundler/setup'

Bundler.require(:development)

require 'active_support/all'
require 'action_controller'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.mock_with :rspec

  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
  config.before(:all) do
    require 'garnish'

    class TestClass
      def eigenclass
        (class << self; self end)
      end

      def self.relations
        {:users => []}
      end

      def self.reflections
        {:users => []}
      end
    end

    module TestClassPresenter
      include Garnish::Presenter
    end

    class TestController < ActionController::Base
    end

    class TestResponder
      include Garnish::Converter

      attr_accessor :template
    end
  end
end
