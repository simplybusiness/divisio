ENV['RACK_ENV'] = "test"

require 'mongoid'
require 'divisio'

Mongoid.load!("mongoid.yml")

RSpec.configure do |config|
  config.before(:each) do
    Mongoid::Sessions.default.collections.each(&:drop)
    Divisio.default_adapter = Divisio::TestAdapter
  end
end
