module ActiveCrypto
  class Encryptor

    attr_reader :options

    def initialize(field, options = {})
      @field = field
      @options = options
    end

    def encrypt(plain_text, key, options)
      # TODO
      cipher = OpenSSL::Cipher::Cipher.new(options)
    end

    def decrypt(cipher_text, key, opts)
      # TODO
      cipher = OpenSSL::Cipher::Cipher.new(options)
    end

  end
end
