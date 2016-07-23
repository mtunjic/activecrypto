#-------------------------------
# Copyright © 2016 Marko Tunjic.
#-------------------------------

require "active_crypto/version"
require 'active_support/concern'

module ActiveCrypto

  extend ActiveSupport::Concern

    class_methods do
      def encrypt(*attr_names)
        #TODO: encrypter = Encrypter.new(attr_names)
        #define_method(:after_find) { }
      end
    end

end

ActiveRecord::Base.send(:include, ActiveCrypto)


