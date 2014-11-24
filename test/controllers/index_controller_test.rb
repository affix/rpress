require 'test_helper'

describe IndexController do

  before do
    create_user
    generate_post_data
  end

  it "should visit the home page" do
    visit root_path
    page.should have_content "Test Category 1"
    page.should have_content "Test Category 2"
    page.should have_content "Categories"
    page.should have_content "GitHub"
    page.should have_content "Twitter"
  end

end
