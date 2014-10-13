%w(mongoid_adapter test_adapter modulo_algorithm).each do |f|
  require "divisio/#{f}"
end

class Divisio

  #change adapter type by providing different :adapter_type option to split method
  @default_adapter = Divisio::TestAdapter
  class << self
    attr_accessor :default_adapter
  end

  attr_accessor :adapter
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
