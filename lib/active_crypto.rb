#-------------------------------
# Copyright © 2016 Marko Tunjic.
#-------------------------------
require 'active_crypto/version'
require 'active_support/concern'
require 'active_crypto/encryptor'

module ActiveCrypto

  extend ActiveSupport::Concern

    class_methods do
      def encrypt(attribute, options = {})
        # setup
        encryptor = ActiveCrypto::Encryptor.new(attribute, options)
        # hooks
        before_save(encryptor)
        after_save(encryptor)
        after_find(encryptor)
        define_method(:after_find) { }
      end

      def encryption_key
        Rails.application.secrets.secret_key_base
      end
    end

end
ActiveRecord::Base.send(:include, ActiveCrypto)


