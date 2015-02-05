Given(/^I visit the homepage$/) do
  visit('/')
  find('#pageOne').should be_visible
  page.should_not have_css('#pageTwo')
end

When(/^I decide to get started$/) do
  click_on('Start')
end

Then(/^I should see the introductory page$/) do
  page.should_not have_css('#pageOne')
  find('#pageTwo').should be_visible
end
