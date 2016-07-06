# Product Overview

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'product_overview', github: 'salesworker/product_overview'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install product_overview

## Usage

Get your API key and make sure the gem is configured to use it. If you're using Rails, this might go in an initializer like `config/initializers/product_overview.rb`.

```ruby
Dota.configure do |config|
  config.api_server = ENV.fetch("API_SERVER")
  config.api_key = ENV.fetch("API_KEY")

  # Set API version (defaults to "v1")
  # config.api_version = "v1"
end
```

Then use the client:

```ruby
api = ProductOverview.api

set = api.external_set(10)       # => (Cached) A single set
set.products                     # => (Cached) Products from the set
set.fields                       # => (Cached) Products fields

set.get_field_type('Name')       # => (Cached) A type for the field - "text"
set.get_field('Name')            # => (Cached) A value for the field - { name: 'Name', type: 'text', value: {} }
```

### API Objects

#### ExternalSet

```ruby
external_set.name        # String, Sets name
external_set.products    # Array, Products
```

#### Product

```ruby
product.name             # String, Products name
product.field_values     # Array,  Products values
```

## License

Copyright © Alex Kholodniak

Distributed under the [MIT License](http://www.opensource.org/licenses/MIT).
