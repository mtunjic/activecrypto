# Active Crypto

[![Build Status](https://travis-ci.org/mtunjic/activecrypto.svg?branch=master)](https://travis-ci.org/mtunjic/activecrypto)
[![Gem Version](https://badge.fury.io/rb/activecrypto.svg)](https://badge.fury.io/rb/activecrypto)

Encryption and decryption of a model's properties (Rails 4.1+, OpenSSL)

NOTE: Default key will be used from the **secrets.yml** file

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activecrypto'
```

And then execute:

    $ bundle

Next, you need to run the generator:
    
    $ rails g crypto:install


## Usage

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


## People

The big thanks goes to Ben Poweski & David Raphael

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mtunjic/activecrypto.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
