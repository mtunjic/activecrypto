$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
begin
  require "openssl"
  OpenSSL.fips_mode=false
  rescue LoadError
end

require 'active_crypto/encryptor'
