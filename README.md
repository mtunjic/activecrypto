# Active Crypto

Encryption and decryption of a model's properties (Rails 4.1+)
* NOTE: key will be used from the secrets.yml file

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activecrypto'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activecrypto

## Usage

```ruby
# config/application.rb
require 'active_crypto' 
```

```ruby
#app/models/user.rb
class User < ActiveRecord::Base
  encrypt :column_name
  ...
 end
```



## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mtunjic/active_encryptor.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

