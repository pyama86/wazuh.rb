# wazuh-rb

## Installation

Add this line to your application's Gemfile:

    gem 'wazuh.rb'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wazuh.rb

## Usage

```rb
Wazuh.configure do |config|
  config.api_endpoint = "your endpoint"
end

agents = Wazuh.agents
```

## Contributing

1. Fork it ( https://github.com/pyama86/wazuh.rb/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
