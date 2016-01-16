ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'rspec/rails'
require 'rspec/autorun'
require "paperclip/matchers"

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
   config.include Devise::TestHelpers, :type => :controller
   config.extend ControllerMacros, :type => :controller
   config.fixture_path = "#{::Rails.root}/spec/fixtures"
   config.use_transactional_fixtures = true
   config.infer_base_class_for_anonymous_controllers = false
end

class ActiveSupport::TestCase
  fixtures :all
end

# class PetTest < ActiveSupport::TestCase
#   should have_attached_file(:avatar)
#   should validate_attachment_presence(:avatar)
#   # should validate_attachment_content_type(:avatar).
#   #              allowing('image/png', 'image/gif').
#   #              rejecting('text/plain', 'text/xml')
#   # should validate_attachment_size(:avatar).
#   #              less_than(2.megabytes)
# end





