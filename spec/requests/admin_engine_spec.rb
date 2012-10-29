# -*- encoding : utf-8 -*-"
#
# @author Andi Altendorfer <andreas@altendorfer.at>
#
require "rspec"

describe "Admin Engine" do

  before(:each) do
    User.delete_all
    _admin = create_authenticated_user('Admin', {password: 'secret', password_confirmation: 'secret'} )
    _admin.is_admin = true
    _admin.save!
  end

  it "should redirect to log in" do
    delete sign_out_path
    visit admin_path
    page.should have_content "Sign In"
    page.should_not have_content "Dashboard"
  end

  it "should show a dashboard if admin is logged in" do
    sign_in_as_admin
    visit admin_path
    page.should have_content "Dashboard"
  end

end