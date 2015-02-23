Given(/^I visit the homepage$/) do
  visit('/')
  find('#page_index').should be_visible
  page.should_not have_css('#page_information')
end

When(/^I decide to get started$/) do
  click_on('Start')
end

Then(/^I should see the first introductory page$/) do
  page.should_not have_css('#page_index')
  find('#page_information').should be_visible
end
