require 'active_crypto'

if RAILS_ENV['production']
  ActiveRecord::Base.encryption_key = File::read('/encryption.key')
else
  # test and development configuration
  # Rails.application.secrets.secret_key_base
end
