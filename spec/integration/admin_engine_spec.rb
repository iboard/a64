# -*- encoding : utf-8 -*-"
#
# @author Andi Altendorfer <andreas@altendorfer.at>
#
require "rspec"

describe "Admin Engine" do

  it "should redirect to login if ! user.is_admin?" do
    delete sign_out_path
    visit admin_path
    page.should have_content I18n.translate('admin.action.needs_sign_in', action: "Admin")
    page.should_not have_content "Admin Dashboard"
  end

  it "should show the dashboard if user is admin" do
    sign_in_as_admin
    visit admin_path
    page.should have_content "Admin Dashboard"
  end

end