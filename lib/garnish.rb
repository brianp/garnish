require 'garnish/version'
require 'garnish/responder'
require 'garnish/controller'
require 'garnish/presenter'
require 'garnish/presenter/relationships'

require 'garnish/adapters/base'
require 'garnish/adapters/mongoid' if defined?(Mongoid) && defined?(Mongoid::Document)

