%w(mongoid_adapter test_adapter modulo_algorithm).each do |f|
  require "divisio/#{f}"
end

module Divisio

  #change adapter type by providing different :adapter_type option to split method
  @default_adapter = Divisio::TestAdapter
  class << self
    attr_accessor :default_adapter
  end

  def self.split(experiment_name, variants, identity, options = {})
    adapter(options).split(experiment_name, variants, identity)
  end

  def self.delete_experiment_for_identity(identity, experiment_name, options = {})
    adapter(options).delete_experiment_for_identity(identity, experiment_name)
  end

  def self.adapter(options)
    options.fetch(:adapter) { default_adapter }
  end

end
