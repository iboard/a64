# -*- encoding : utf-8 -*-"
#
# @author Andi Altendorfer <andreas@altendorfer.at>
#
require "rspec"

describe SessionController do

  before(:each) do
    User.delete_all
    create_authenticated_user('Testuser', {password: 'secret', password_confirmation: 'secret'})
  end

  it "should log in a valid user" do
    visit new_session_path
    fill_in 'Username', with: 'Testuser'
    fill_in 'Password', with: 'secret'
    click_button "Log in"
    page.should have_content I18n.t('successfully_logged_in_as', username: 'Testuser')
  end

  it "should not accept wrong password" do
    visit new_session_path
    fill_in "Username", with: "Testuser"
    fill_in "Password", with: "wrong password"
    click_button "Log in"
    page.should have_content I18n.t('invalid_login')
  end

  it "should not accept wrong username" do
    visit new_session_path
    fill_in "Username", with: "Not A Testuser"
    fill_in "Password", with: "any password"
    click_button "Log in"
    page.should have_content I18n.t('invalid_login')
  end

end