require 'test_helper'

describe SessionsController do
  before do
    create_user
  end

  it "should sign in a user" do
    visit login_path
    fill_in 'Email', with: "test@user.com"
    fill_in 'Password', with: "1234567890"
    click_button 'Sign In'
    page.should have_content "You are now logged in About Keiran Smith"
  end

  it "should not sign in an invalid user" do
    visit login_path
    fill_in 'Email', with: "test2@user.com"
    fill_in 'Password', with: "1234567890"
    click_button 'Sign In'
    page.should have_content "Invalid email/password"
  end

  it "Should not sign in with invalid password" do
    visit login_path
    fill_in 'Email', with: "test@user.com"
    fill_in 'Password', with: "invalid"
    click_button 'Sign In'
    page.should have_content "Invalid email/password"
  end

  it "Should not sign in with no details" do
    visit login_path
    click_button 'Sign In'
    page.should have_content "Invalid email/password"
  end

end
