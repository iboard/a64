# -*- encoding : utf-8 -*-"
#
# @author Andi Altendorfer <andreas@altendorfer.at>
#

module BootrapHelper


  def icon(icon)
    "<i class='#{bootstrap_icon(icon)}'></i>".html_safe
  end


  private
  def bootstrap_icon(icon)
    case icon.to_s
      when 'home'
        'icon-home'
      else
        'icon-certificate'
    end
  end

end