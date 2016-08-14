#
#  cipher.rb
#
#  Created by Marko Tunjic on 15/07/16.
#  Copyright © 2016 Marko Tunjic. All rights reserved.
#
module Cipher
  def encrypt(text, key, opt)
      cipher = OpenSSL::Cipher.new(cipher(opt))
      cipher.encrypt
      cipher.key = key
      iv = cipher.random_iv
      encrypted = cipher.update(text) + cipher.final
      encrypted.insert(0, iv)
      Base64.encode64(encrypted)
    end

    def decrypt(text, key, opt)
      decipher = OpenSSL::Cipher.new(cipher(opt))
      decipher.decrypt
      decoded_text = Base64.decode64(text)
      decipher.key = key
      decipher.iv  = decoded_text.slice!(0..15)
      decrypted = decipher.update(decoded_text)
      decrypted << decipher.final
    end

    def cipher(opts)
      "#{opts[:cipher]}-#{opts[:keylength]}-#{opts[:block_mode]}"
    end
  end
