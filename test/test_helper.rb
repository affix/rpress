ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/spec"
require "minitest/autorun"
require "capybara"
require 'rspec/expectations'
require 'capybara/poltergeist'
require "capybara/rails"
require "minitest/rails/capybara"

# Set Config Secret Key for CI Builds
Blog::Application.config.secret_key_base = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890G'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  extend MiniTest::Spec::DSL
  include Capybara::DSL
  include Capybara::Assertions

  register_spec_type self do |desc|
    desc < ActiveRecord::Base if desc.is_a? Class
  end

  def create_user
    Author.create(first_name: "Keiran", last_name: "Smith", email: "test@user.com", password: "1234567890", password_confirmation: "1234567890").save
  end

  def generate_post_data
    10.times do |x|
      Category.create(:category_title => "Test Category #{x}", :category_slug => "test-category-#{x}")
      Post.create(:post_title => "Test Post #{x}", :post_slug => "test-post-#{x}", :post_body =>
                                                     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nec ligula lacinia, vehicula ante convallis, ullamcorper velit. Vestibulum eu viverra nunc. Nunc ac lobortis diam. Phasellus placerat nibh vel tempor sodales. Mauris pellentesque ornare odio, quis faucibus orci tempor et. Donec tincidunt mi interdum, elementum est rhoncus, lacinia neque. Fusce pharetra, augue semper malesuada suscipit, elit elit semper mi, eget luctus libero libero non dolor. Morbi ac sapien lacinia, pellentesque dolor adipiscing, volutpat risus. Donec id odio laoreet, adipiscing elit id, sollicitudin nunc. Pellentesque vel orci a arcu ornare placerat vel vel lorem. Nulla accumsan varius ullamcorper. Nullam lobortis quam nisi, ac volutpat odio pretium ac. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
<MORE>
Morbi tincidunt a sem quis ullamcorper. Cras sit amet eros elit. Donec faucibus ipsum in lobortis aliquet. Nullam sed fermentum urna. Praesent quis cursus orci. Cras lacinia molestie metus nec luctus. Etiam sit amet mauris sed dui accumsan sodales a id tellus. Fusce et metus vel libero pulvinar auctor a in nunc. Praesent nec mi quis lorem consequat tempor non et elit. Integer tristique commodo lorem sed pulvinar. Vestibulum eget molestie massa, ac accumsan orci. Ut posuere lacus quis arcu facilisis consectetur. Proin vitae sem sit amet dui convallis mollis et mollis purus.

Nunc id rhoncus dolor. Sed gravida, felis in bibendum interdum, ligula sapien adipiscing enim, ut tristique arcu lorem ac nibh. Sed at consectetur magna. Sed eget nisi libero. Donec vel sollicitudin arcu, quis dignissim lectus. Donec quis rhoncus arcu, id tristique nulla. Vestibulum eu erat risus. Suspendisse cursus nisi at est molestie lobortis. Nunc nibh est, tincidunt vel tincidunt scelerisque, vehicula quis massa. Aenean non sapien eu urna porttitor pharetra at non mi. Cras dolor tortor, varius non euismod ullamcorper, pretium eget odio. Phasellus in risus ac orci bibendum tempor. Cras lobortis semper magna sit amet facilisis.

Nulla lacinia sollicitudin nunc, sed viverra eros venenatis nec. Vivamus condimentum, felis sed consectetur laoreet, eros lectus ultricies nisl, sed vulputate felis libero id leo. Vestibulum quis faucibus sapien. Integer quis dui sollicitudin ligula bibendum bibendum id in purus. Praesent fringilla ultricies semper. Nullam elit mi, lobortis a quam eu, dictum tincidunt libero. Sed nec hendrerit purus, in aliquet magna. Cras sit amet luctus dolor. Donec ante mi, pretium vel lectus non, pulvinar molestie justo. Interdum et malesuada fames ac ante ipsum primis in faucibus. Phasellus accumsan quam lectus, ac ultricies nunc pellentesque et. Maecenas egestas sollicitudin venenatis. Mauris auctor tellus eu placerat accumsan. Nulla in mauris a risus ultricies ultrices vitae vel lacus. Aliquam eleifend, ante sit amet consectetur venenatis, orci nisi venenatis ligula, nec posuere massa augue quis sem. Nulla et lorem id ipsum laoreet posuere.

Ut ac suscipit diam. Vestibulum id sem ullamcorper mauris molestie egestas at sed turpis. Nam dapibus viverra magna, a accumsan urna pulvinar eget. Nullam lobortis ligula laoreet, aliquam tortor sit amet, fermentum tellus. Nunc sapien libero, porttitor nec est non, tempus elementum quam. Etiam eget risus volutpat, lacinia purus vitae, venenatis risus. Sed sodales ultrices sapien ac molestie. Fusce vestibulum pulvinar orci elementum congue. Donec ac orci porttitor, pretium tortor at, tristique mauris. In hac habitasse platea dictumst. Vestibulum eget metus ut nulla mattis consequat. Suspendisse at nunc nisi. Quisque tempor ullamcorper dui vel aliquam.", :category_id => x, :author_id => 1)
    end
  end
end
