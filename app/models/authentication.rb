# -*- encoding : utf-8 -*-"

# Authenticaton is embedded in user.
# @abstract
# @attr [String] :provider  local, facebook, google, ...
class Authentication
  include Mongoid::Document

  embedded_in :user
  field       :provider, default: 'local'

end