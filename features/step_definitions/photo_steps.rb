Given(/^I am on the photo page$/) do
  find('#pageEight').should be_visible
  page.should_not have_css('#pageSeven')
  find('#screen').click
end

When(/^have taken a photo$/) do
  click_on('OK...')
end

Then(/^I arrive on the material page$/) do
  # find('#pageNine').should be_visible
  page.should_not have_css('#pageEight')
end