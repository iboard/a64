# -*- encoding : utf-8 -*-"
#
# @author Andi Altendorfer <andreas@altendorfer.at>
#

# = class User
# is responsible to identify users by their :name
# User-authentication will be managed in an extra class not in model User!
# Keep this model as small as possible and take care not to create unnecessary dependencies.
# @attr [String] name unique username, used "parameterized" as the document-id
#   validates: uniqueness, presence
# @attr [String] _id for new :key-behavior of MongoId.
#   Use :name as key, name("Andi Altendorfer") -> :_id => 'andi-altendorfer'
class User
  include Mongoid::Document

  field :name
  validates_presence_of :name
  validates_uniqueness_of :name

  field :_id, type: String, default: ->{ name.parameterize('-') if name }
  field :is_admin, type: Boolean, default: false
  attr_protected :admin

  embeds_many :authentications

  # @return Boolean - true if user has no authentication
  def anonymous?
    self.authentications.count == 0
  end

  # @param [String] password - clear text password
  # @return Authentication - first authentication of user which responds true on authenticate or nil
  def authenticate(password)
    self.authentications.detect do |_auth|
      _auth.authenticate(password) if _auth.respond_to?(:authenticate) && _auth.password_digest
    end
  end
end