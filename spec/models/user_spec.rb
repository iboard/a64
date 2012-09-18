# -*- encoding : utf-8 -*-"
#
# @author Andi Altendorfer <andreas@altendorfer.at>
#
require "rspec"

describe User do

  before(:each) do
    User.delete_all
  end

  it "should store with key-name" do
    user = User.create name: "User 1"
    User.find("user-1").should == user
  end

  it "validates unique keys" do
    user1 = User.create name: "User 1"
    user1.should be_valid
    user2 = User.create name: "User 1"
    user2.should_not be_valid
    user2.errors.messages[:name].should include('is already taken')
  end

  it "validates key presence" do
    user = User.create
    user.should_not be_valid
    user.errors[:name].should include('can\'t be blank')
  end

end