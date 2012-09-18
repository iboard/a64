# -*- encoding : utf-8 -*-"
#
# @author Andi Altendorfer <andreas@altendorfer.at>
# September 18, 2012
#
require "rspec"

describe Mongoid do

  it "should loads settings" do
    Mongoid::Config::settings[:raise_not_found_error].should  be_true
  end

  it "can store documents" do
    class TestDocument
      include Mongoid::Document
      field :name
    end
    document = TestDocument.create name: "First Document"
    TestDocument.first._id.should.eql? document._id
    TestDocument.first.name.should == "First Document"
  end

end