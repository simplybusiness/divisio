ENV['RACK_ENV'] = 'test'

Dir['./spec/support/**/*.rb'].sort.each { |f| require f}

require 'mongoid'
require 'divisio'

Mongoid.load!('mongoid.yml')

RSpec.configure do |config|
  config.before(:each) do
    Mongoid.purge!
  end
end
