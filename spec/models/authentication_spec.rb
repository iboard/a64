# -*- encoding : utf-8 -*-"
#
# @author Andi Altendorfer <andreas@altendorfer.at>
#
require "rspec"
require "support/authentication_helper"

describe Authentication do

  before(:each) do
    @authenticated_user = create_authenticated_user("Authenticated User")
  end

  it "should be embedded in user" do
    @authenticated_user.authentications.count.should == 1
  end

  describe PasswordAuthentication do

    it "authenticates by password" do
      @authenticated_user.authentications.create!(
        { provider: 'local', password: 'secret', password_confirmation: 'secret' },
        PasswordAuthentication
      )
      @authenticated_user.authenticate('secret').class.should == PasswordAuthentication
      @authenticated_user.authenticate('wrong password').should be_nil
    end

  end
end