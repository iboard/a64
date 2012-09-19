# -*- encoding : utf-8 -*-"
#
# @author Andi Altendorfer <andreas@altendorfer.at>
#

# = class User
# is responsible to identify users by their :name
# User-authentication will be managed in an extra class not in model User!
# Keep this model as small as possible and take care not to create unnecessary dependencies.
class User
  include Mongoid::Document

  # unique id and name
  field :name
  validates_presence_of :name
  validates_uniqueness_of :name

  # new :key-behavior of MongoId. Use :name as key, name("Andi Altendorfer") -> :_id => 'andi-altendorfer'
  field :_id, type: String, default: ->{ name.parameterize('-') if name }
end