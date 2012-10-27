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
end