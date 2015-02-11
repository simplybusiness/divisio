require 'divisio/base_adapter'
require 'divisio/no_persistence_adapter'
require 'divisio/modulo_algorithm'
require 'divisio/mongoid_adapter' if defined? Mongoid

class Divisio

  @default_adapter = Divisio::NoPersistenceAdapter
  class << self
    attr_accessor :default_adapter
  end

  attr_reader :adapter
  private :adapter

  def initialize(adapter: self.class.default_adapter)
    @adapter = adapter
  end

  def split(experiment_name, variants, identity)
    adapter.split(experiment_name, variants, identity)
  end

  def delete_experiment_for_identity(identity, experiment_name)
    adapter.delete_experiment_for_identity(identity, experiment_name)
  end
end
