require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

ENV["RACK_ENV"] = "test"

require 'support/wait_for_ajax'
require './app/server'
require 'helpers/helper'
require 'database_cleaner'
require 'capybara'
require 'capybara/rspec'
require 'dm-migrations'

Capybara.app = LookUp.new

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

RSpec.configure do |config|

  config.include Capybara::DSL

  config.include WaitForAjax

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:suite) do
    DataMapper.auto_migrate!
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end
