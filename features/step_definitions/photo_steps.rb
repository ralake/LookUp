Given(/^I am on the photo page$/) do
  visit('/')
  click_on('Start')
  page.execute_script("show('pageEight');")
end

When(/^have taken a photo$/) do
  find('#toPageEightPointFive').click();
end

Then(/^I arrive on the material page$/) do
  page.should_not have_css('#pageEight')
end