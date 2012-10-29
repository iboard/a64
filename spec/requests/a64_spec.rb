# -*- encoding : utf-8 -*-"
require "rspec"


describe "Application's root path" do

  describe PagesController do

    it "should have the page title to lead to root_path" do
      visit root_path
      page.all("a", href: root_path, text: "A64").should_not be_nil
    end

  end

end