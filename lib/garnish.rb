require 'garnish/version'
require 'garnish/converter'
require 'garnish/responder'
require 'garnish/controller'
require 'garnish/presenter/relationships'
require 'garnish/presenter'

require 'garnish/model_adapters/abstract_adapter'
require 'garnish/model_adapters/default_adapter'
require 'garnish/model_adapters/mongoid_adapter' if defined? Mongoid
require 'garnish/model_adapters/active_record_adapter' if defined? ActiveRecord
