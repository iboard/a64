# -*- encoding : utf-8 -*-"
#
# @author Andi Altendorfer <andreas@altendorfer.at>
#
require "rspec"

describe BootstrapHelper do
  include BootstrapHelper
  it "should draws icons by symbols" do
    icon(:home).should =~ /icon-home/
    icon(:default_or_missing).should =~ /icon-certificate/
  end

end