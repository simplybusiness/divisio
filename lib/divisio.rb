%w(mongoid_adapter test_adapter modulo_algorithm).each do |f|
  require "divisio/#{f}"
end

module Divisio

  #change adapter type by providing different :adapter_type option to split method
  @default_adapter = "Test"
  class << self
    attr_accessor :default_adapter
  end

  MONGOID_ADAPTER = "Mongoid"

  def self.split(experiment_name, variants, identity, options = {})
    adapter(options).split(experiment_name, variants, identity)
  end

  def self.delete_experiment_for_identity(identity, experiment_name, options = {})
    adapter(options).delete_experiment_for_identity(identity, experiment_name)
  end

  def self.adapter(options)
    adapter_class = options.fetch(:adapter_type) { default_adapter }
    Object.const_get("Divisio::#{adapter_class}Adapter")
  end

end
