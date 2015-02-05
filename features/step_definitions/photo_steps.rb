Given(/^I am on the photo page$/) do
  find('#pageSix').should be_visible
  page.should_not have_css('#pageSeven')
  find('#screen').click
end

When(/^have taken a photo$/) do
  click_on('OK...')
end

Then(/^I arrive on the material page$/) do
  find('#pageSeven').should be_visible
  page.should_not have_css('#pageSix')
end