# Divisio

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'divisio'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install divisio

## Usage
```ruby
experiment_name = 'experiment1'
variants=[1,2,3]
identity="dragos"

Divisio.split(experiment_name, variants, identity, adapter: Divisio::MongoidAdapter) # ==>> "1"
```
You can also specify the default adapter in your initializers as so:

```ruby
Divisio.default_adapter = Divisio::MongoidAdapter
```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/divisio/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
