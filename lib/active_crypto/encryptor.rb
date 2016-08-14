require 'openssl'
require 'base64'
require 'active_crypto/cipher'

module ActiveCrypto
  class Encryptor
    include Cipher

    attr_reader :options

    def initialize(field, options = {})

      @field = field
      @options = {:cipher     => 'AES',
                  :block_mode => 'CBC',
                  :keylength  => 256}.merge(options)
    end

    def before_save(model)
      unless model[@field].blank?
        key = model.class.encryption_key
        model[@field] = encrypt(model[@field], key, @options)
      end
    end

    def after_save(model)
      unless model[@field].blank?
        key = model.class.encryption_key
        model[@field] = decrypt(model[@field], key, @options)
      end
    end

    alias_method :after_find, :after_save

  end
end
