# -*- encoding : utf-8 -*-"
#
# @author Andi Altendorfer <andreas@altendorfer.at>
#
require "rspec"

describe BootstrapHelper do
  include BootstrapHelper
  it "should draw icons by symbols" do
    icon(:home).should =~ /icon-home/
    icon(:user).should =~ /icon-user/
    icon(:setup).should =~ /icon-cog/
    icon(:default_or_missing).should =~ /icon-certificate/
  end

  it "should map flash-classes to bootstrap-error-classes" do
    bootstrap_flash_class('alert').should == "alert-error"
    bootstrap_flash_class('notice').should == "alert-success"
    bootstrap_flash_class('anything_else').should == "alert-info"
  end

end