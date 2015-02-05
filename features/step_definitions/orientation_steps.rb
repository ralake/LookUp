Given(/^I am on the orientation page$/) do
  visit '/'
  click_on('Start')
  find('#toPageThree').click
end

When(/^I am happy with my compass position$/) do
  find('#toPageFour').click
end

Then(/^I should proceed to the next step$/) do
  page.should_not have_css('#pageThree')
  find('#pageFour').should be_visible 
end
