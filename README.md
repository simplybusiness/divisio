# Divisio

This gem assigns identities to a variant inside an experiment. It is similar to ab-tests framework.

A triplet - experiment, variants and identities will always produce the same variant outcome even if the test is deleted and rerun.

You can run multiple instances of the framework inside the same application for different adapters

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

Divisio.new(adapter: Divisio::MongoidAdapter).split(experiment_name, variants, identity) # ==>> "1"
```
You can also specify the default adapter in your initializers as so:

```ruby
Divisio.default_adapter = Divisio::MongoidAdapter
```

then

```ruby
Divisio.new.split(experiment_name, variants, identity) # ==>> "1"
```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/divisio/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
