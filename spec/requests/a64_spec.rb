# -*- encoding : utf-8 -*-"
require "rspec"

describe PagesController do

  it "should says hello" do
    visit root_path
    page.should have_content "A64"
  end

end