# koremutake

* A Crystal library with the koremutake algorithm.
* Convert numbers to words that (supposedly) are easier to remember and compare.

## Installation

1. Add the dependency to your `shard.yml`:
```yaml
dependencies:
  koremutake:
    github: tijn/koremutake
```
2. Run `shards install`

## Usage

```crystal
require "koremutake"

string = Koremutake.encode(0) # => "Ba"
Koremutake.encode(10610353957) # => "Koremutake"
Koremutake.decode(string) # => 0
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/tijn/koremutake/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Tijn Schuurmans](https://github.com/tijn) - creator and maintainer
