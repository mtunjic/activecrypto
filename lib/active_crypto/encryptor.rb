require 'openssl'
require 'base64'

module ActiveCrypto
  class Encryptor

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

    def encrypt(text, key, opt)
      cipher = OpenSSL::Cipher.new(algorithm(opt))
      cipher.encrypt
      cipher.key = key
      iv = cipher.random_iv
      encrypted = cipher.update(text) + cipher.final
      encrypted.insert(0, iv)
      Base64.encode64(encrypted)
    end

    def decrypt(text, key, opt)
      decipher = OpenSSL::Cipher.new(algorithm(opt))
      decipher.decrypt
      decoded_text = Base64.decode64(text)
      decipher.key = key
      decipher.iv  = decoded_text.slice!(0..15)
      decrypted = decipher.update(decoded_text)
      decrypted << decipher.final
    end

    def algorithm(opts)
      "#{opts[:cipher]}-#{opts[:keylength]}-#{opts[:block_mode]}"
    end

    alias_method :after_find, :after_save

  end
end
