ENV["RACK_ENV"] = "test"

require './app/server'
require 'database_cleaner'
require 'capybara'
require 'capybara/rspec'
require 'dm-migrations'

Capybara.app = LookUp.new

RSpec.configure do |config|

  config.include Capybara::DSL

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
