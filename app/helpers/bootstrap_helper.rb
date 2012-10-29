# -*- encoding : utf-8 -*-"
#
# @author Andi Altendorfer <andreas@altendorfer.at>
#

# = BootstrapHelper
# provides some methods to map bootstrap-specific logics.
module BootstrapHelper

  # @param [String|Symbol] icon
  # @see #bootstrap_icon
  # @return [String] HTML-string to 'draw' an icon
  def icon(icon)
    "<i class='#{bootstrap_icon(icon)}'></i>".html_safe
  end

  # = button_to
  # Adds class 'btn-primary-link' to define "white" text-color in links if btn is dark (red/danger, blue/primary)
  #
  # @example HAML-usage
  #   = button_to classes: "btn-primary" { link_to "Somewhare", "http://....." }
  #
  # @param [Hash] options
  # @option options [String] :classes additional bootstrap btn-classes, eg. 'btn-primary'
  # @return [String] - HTML Bootstrap button with :block inside
  def button_to(options={}, &block)
    if options[:classes].present?
      options[:classes] += " btn-primary-link" if options[:classes] =~ /(btn-primary)|(btn-danger)/
    end
    content_tag :button, class: "btn #{options[:classes]}" do
      yield
    end
  end

  # draw a caret (dor dropdowns)
  # @return [String] - HTML-String representing a caret "v"
  def caret
    "<b class='caret'></b>".html_safe
  end

  private # @!group private methods

  # = map symbols to bootstrap-classes
  # @param [Symbol|String] icon
  #
  # Map:
  #   :home             ... 'icon-home'
  #   :setup            ... 'icon-cog'
  #   default, missing  ... 'icon-certificate'
  #
  # @return [String] - the icon-class for twitter bootstrap
  def bootstrap_icon(icon)
    case icon.to_s
      when 'user'
        'icon-user'
      when 'home'
        'icon-home'
      when 'setup'
        'icon-cog'
      else
        'icon-certificate'
    end
  end

  # = map Rails::flashes[:type] to Bootstrap-alert-classes
  # @param [Symbol|String] flash_class
  #
  # Map:
  #   :alert             ... 'alert-error'
  #   :notice            ... 'alert-success'
  #   default, missing   ... 'alert-info'
  #
  # @return [String] - the icon-class for twitter bootstrap
  def bootstrap_flash_class(flash_class)
    case flash_class.to_s
      when 'alert'
        'alert-error'
      when 'notice'
        'alert-success'
      else
        'alert-info'
    end
  end
  # @!endgroup

end