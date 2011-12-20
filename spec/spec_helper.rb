require 'rubygems'
require 'bundler/setup'

Bundler.require(:development)

require 'active_support/all'
require 'action_controller'
require 'garnish'

# Spork.prefork do
  Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

  RSpec.configure do |config|
    config.mock_with :rspec

    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.filter_run :focus => true
    config.run_all_when_everything_filtered = true
  end
# end

# Spork.each_run do

# end

class TestClass
  def self.relations
    {:users => []}
  end

  def self.reflections
    {:users => []}
  end
end

class TestClassPresenter
  include Garnish::Presenter
end

class TestController < ActionController::Base
end
