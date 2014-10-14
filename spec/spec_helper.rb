ENV['RACK_ENV'] = "test"

require 'rubygems'
require 'bundler/setup'
require 'mongoid'
require 'divisio'

Mongoid.load!("mongoid.yml")

RSpec.configure do |config|
  config.order = 'random'
  config.before(:each) do
    Mongoid::Sessions.default.collections.each(&:drop)
    # Divisio.default_adapter = Divisio::TestAdapter
  end
end
