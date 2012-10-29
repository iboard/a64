# -*- encoding : utf-8 -*-"
#
# @author Andi Altendorfer <andreas@altendorfer.at>
#
require "rspec"
require "support/authentication_helper"

describe User do

  before(:each) do
    User.delete_all
  end

  describe "is unique" do

    it "should store with key-name" do
      user = User.create name: "User 1"
      User.find("user-1").should == user
    end

    it "should validate unique keys" do
      user1 = User.create name: "User 1"
      user1.should be_valid
      user2 = User.create name: "User 1"
      user2.should_not be_valid
      user2.errors.messages[:name].should include('is already taken')
    end

    it "should validate key presence" do
      user = User.create
      user.should_not be_valid
      user.errors[:name].should include('can\'t be blank')
    end

  end

  describe "can authenticated" do

    before do
      @user = User.create name: "Guest"
    end

    describe "by authentications" do

      it "should be a guest if no authentication exists" do
        @user.anonymous?.should be_true
      end

      it "shouldn't be a guest if an authentication exists" do
        @user = create_authenticated_user("Authenticated User")
        @user.authentications.create
        @user.anonymous?.should be_false
      end

    end

  end
end