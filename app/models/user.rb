# -*- encoding : utf-8 -*-"
#
# @author Andi Altendorfer <andreas@altendorfer.at>
#

class User
  include Mongoid::Document

  field :name
  field :_id, type: String, default: ->{ name.parameterize('-') if name }

  validates_presence_of :name
  validates_uniqueness_of :name
end