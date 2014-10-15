# Divisio

This gem assigns identities to a variant inside an experiment. It is similar to ab-tests framework.

A triplet - experiment, variants and identities will always produce the same variant outcome even if the test is deleted and rerun.

You can run multiple instances of the framework inside the same application for different adapters.

You can use it wherever you want however you want (you can make a global object for entire application or you can make individual little objects to be used inside methods).
It is up to you do decide!

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

## Further example

You can use what it returns *directly*, for example if you want to render a partial you could do:
```ruby
partial = Divisio.new.split("amazing partial", ["partial1", "partial2"], identity)
render(partial)
```

If we want to do complex logic based on some idiom, you need to do if/case statements:
```ruby
#this metohd could be in a global helper
def enable_partial_quotes
  decision = Divisio.new.split("enable_partial_quotes", ["yes", "no"], identity)
  decision == "yes"
end

# .....
# then somewhere else
# .....
if enable_partial_quotes
  # do some stuff
else
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/divisio/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
