#
#  install_generator.rb
#
#  Created by Marko Tunjic on 15/07/16.
#  Copyright © 2016 Marko Tunjic. All rights reserved.
#
module Crypto
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      desc "Creates a Active Crypto initializer."

      def copy_initializer
        template "crypto.rb", "config/initializers/crypto.rb"
      end
    end
  end
end
