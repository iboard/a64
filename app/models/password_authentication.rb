# -*- encoding : utf-8 -*-"
#
# @author Andi Altendorfer <andreas@altendorfer.at>
#

# use 'has_secured_password'
# @example
#  user.authentications.create({password:'secret', password_confirmation:'secret'}, PasswordAuthentication )
class PasswordAuthentication < Authentication
  include ActiveModel::SecurePassword
  field :password_digest, :type => String
  has_secure_password
  validates_presence_of :password, :on => :create
  validates_presence_of :password_confirmation, :on => :create
  validates_confirmation_of :password
end