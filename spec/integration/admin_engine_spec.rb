# -*- encoding : utf-8 -*-"
#
# @author Andi Altendorfer <andreas@altendorfer.at>
#
require "rspec"

describe "Admin Engine" do

  it "should show a dashboard page as root_path" do
    visit admin_path
    page.should have_content "Admin Dashboard"
  end
end