Given(/^I am on the first information page$/) do
  page.should_not have_css('#pageOne')
  find('#pageTwo').should be_visible
end

Then(/^I move on to the second information page$/) do
  click_on("Next")
  page.should_not have_css('#pageTwo')
  find('#pageThree').should be_visible
end
