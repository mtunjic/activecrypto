# Active Crypto

Encryption and decryption of a model's properties (Rails 4.1+, OpenSSL)

NOTE: Default key will be used from the **secrets.yml** file

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
# app/models/user.rb
class User < ActiveRecord::Base
  # basic encrypt (default AES-256-CBC)
  encrypt :column_name
  ...
end
```

Or with with custom cipher like AES-256-CBC 

```ruby
class User < ActiveRecord::Base
  encrypt :column_name, { cipher: 'AES', block_mode: 'CBC', keylength: 256 }
  ...
end
```

If you need to choose an encryption algorithm. You can see the full list with:

```ruby
ruby -r openssl -e 'puts OpenSSL::Cipher.ciphers'
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mtunjic/activecrypto.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

