Given(/^I am on the get started page$/) do
  find('#pageTwo').should be_visible
  page.should_not have_css('#pageOne')
  click_on("Next")
end

Then(/^I move on to the compass page$/) do
  find('#pageThree').should be_visible
  page.should_not have_css('#pageTwo')
end
